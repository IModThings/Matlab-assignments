%This program identifies stars in an image

%This part just automatically CD's to the correct directory.
if(~isdeployed)
  cd(fileparts(which(mfilename)));
end
clear %fixes some random problems
pkg load image  %load image module
%============================Program Starts Here================================
tic; %timing the process
% Read image and calculate amplitude. 
img = imread('./images/stars1.jpg');%CHANGE IN BOTH PLACES
img_gray = rgb2gray(img);

clear img %clearing all un-nessecary variables to save memory (I need every MB!)

fd_img = fft2(img_gray);%fourier image 2 matrix

amplitude = log(abs(fd_img));

% Filter the image by mplitude threshold.
fd_img(amplitude < 14) = 0;
filtered_img = ifft2(fd_img);%fourier matrix 2 image

%norm(imag(filtered_img))%this shows the irrational part of image
filtered_img = uint8(real(filtered_img));

%figure()
%imshow(filtered_img);

sub_img = img_gray - filtered_img;%subtracting low frequency for high pass

%figure()
%imshow(img_gray);

imwrite (img_gray, "step1.png");
clear img_gray
imwrite (filtered_img, "step2.png");

clear filtered_img

%imshow(sub_img);
imwrite (sub_img, "step3.png");

thresh_img = zeros(size(sub_img));
thresh_img(sub_img > 255/4) = 255;

clear sub_img
%figure()
%imshow(thresh_img);
imwrite (thresh_img, "step4.png");

star_num = bwlabel(thresh_img);
props = regionprops(star_num, 'Area', 'Centroid');
pixels_size = [props.Area];
centroids = cat(1,props.Centroid);
star_cordinates = round(vertcat(props.Centroid));

csvwrite('data.csv',[star_cordinates(:,1), star_cordinates(:,2), pixels_size']); %save the data
star_num = max(max(star_num))
count = accumarray([props.Area]', 1);
count = count(any(count,2),:);

toc%end timer

figure()
plot(unique(pixels_size)', count)
axis([0 100]) %100px max because any stars over 100px is definitly an error
title("Comparing Star Size to Star Number", 'FontSize',30)
xlabel("Size of Stars (in pixels)",'FontSize',20)
ylabel("Number of Stars",'FontSize',20)
print -dpng -color "-S1500,1500" chart.png

%==================This part for producing overlayed image======================
%{
tic;%its so fcking slow it gets its own special timer
img = imread('./images/stars1.jpg');
figure()
imshow(img)
hold on
plot(centroids(:,1),centroids(:,2),'b+')
print -dpng -color "-S7000,6000" overlayimg.png
toc
%}
%===============================================================================
