image_xyz=imread('peppers_xyz.png');
figure(1);
imshow(image_xyz);
image_rgb=uint8(zeros(size(image_xyz)));
for j=1:size(image_xyz,1)
	for k=1:size(image_xyz,2)
		[r, g, b]=xyztorgb(image_xyz(j,k,1),image_xyz(j,k,2),image_xyz(j,k,3));
		image_rgb(j,k,1)=r;
		image_rgb(j,k,2)=g;
		image_rgb(j,k,3)=b;
	end
end
figure(2);
imshow(image_rgb);
imwrite(image_rgb,'peppers_rgb_from_xyz.png');