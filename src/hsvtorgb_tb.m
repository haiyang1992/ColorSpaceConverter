image_hsv=imread('peppers_hsv.png');
figure(1);
imshow(image_hsv);
image_rgb=uint8(zeros(size(image_hsv)));
for j=1:size(image_hsv,1)
	for k=1:size(image_hsv,2)
		[r, g, b]=hsvtorgb(image_hsv(j,k,1),image_hsv(j,k,2),image_hsv(j,k,3));
		image_rgb(j,k,1)=r;
		image_rgb(j,k,2)=g;
		image_rgb(j,k,3)=b;
	end
end
figure(2);
imshow(image_rgb);
imwrite(image_rgb,'peppers_rgb_from_hsv.png');