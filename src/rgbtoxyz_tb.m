image_rgb=imread('peppers.png');
figure(1);
imshow(image_rgb);
image_hsv=zeros(size(image_rgb));
for j=1:size(image_rgb,1)
	for k=1:size(image_rgb,2)
		[h, s, v]=rgbtohsv(image_rgb(j,k,1),image_rgb(j,k,2),image_rgb(j,k,3));
		image_hsv(j,k,1)=h*256;
		image_hsv(j,k,2)=s*256;
		image_hsv(j,k,3)=v*256;
	end
end
image_hsv=uint8(image_hsv);
figure(2);
imshow(image_hsv);
imwrite(image_hsv,'peppers_hsv.png');