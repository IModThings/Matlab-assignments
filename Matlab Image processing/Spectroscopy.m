%This program makes a histogram of the colors present in an input image.
%Most of this code is from stackoverflow.

%This part just automatically CD's to the correct directory.
if(~isdeployed)
  cd(fileparts(which(mfilename)));
end
clear %fixes some random problems
close
pkg load image  %load image module
%============================Program Starts Here================================

tic; %timing the process
rgbImage = imread('./images/nebula4.jpg');
%rgbImage = imread(uigetfile ('./images/', {"*.png;*.jpg", "Supported Input Formats"}));
hsvImage = rgb2hsv(rgbImage);
hue_in_deg = hsvImage(:,:,1).*360; % Get the hue plane scaled from 0 to 360
mask = (hsvImage(:,:,2) > .2) & (hsvImage(:,:,3) > .2);
hue_in_deg = hue_in_deg(mask);
%hist(hue_in_deg);

binEdges = 0:270;                     % Edges of histogram bins
N = histc(hue_in_deg(:), binEdges);       % Bin the pixel hues from above
wavelength = linspace(750,380, 270);  % Approximate wavelength

hBar = bar(wavelength, N(1:end-1), 'histc');  % Plot the histogram

set(hBar, 'FaceColor', 'flat', 'EdgeColor', 'none');
set(get(hBar, 'Children'), 'CData', 1:1:270, 'CDataMapping', 'direct');
colormap(hsv(360));                 % Change to an HSV color map with 360 points
axis([380 750 0 max(N)*1.2]);           % Change the axes limits
set(gca, 'Color', 'k');             % Change the axes background color
set(gcf, 'Pos', [50 400 560 400]);  % Change the figure size
xlabel('Wavelength (nm)');          % Add an x label
ylabel('Bin counts');               % Add a y label
toc
