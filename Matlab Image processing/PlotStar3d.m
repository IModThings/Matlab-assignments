%This program plotts an imported CSV of coordinates, assigns each star a random z value and 3d plots it.

if(~isdeployed)
  cd(fileparts(which(mfilename)));
end
clear %fixes some random problems
close
star_coord = csvread('./Results1/data.csv');
len=length(star_coord(:,1));

x = star_coord(:,1);
y = star_coord(:,2);
z = randi(1000, len, 1);
%csvwrite('coordinates2.csv',[x,y,z]); %save the data
scatter3(x,y,z, 'marker', '+', 'markeredgecolor', 'blue')
rotate3d on
