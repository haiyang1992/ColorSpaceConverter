image_yiq=imread('peppers_yiq.png');
figure(1);
imshow(image_yiq);
image_rgb=uint8(zeros(size(image_yiq)));
for j=1:size(image_yiq,1)
	for k=1:size(image_yiq,2)
		[r, g, b]=yiqtorgb(image_yiq(j,k,1),image_yiq(j,k,2),image_yiq(j,k,3));
		image_rgb(j,k,1)=r;
		image_rgb(j,k,2)=g;
		image_rgb(j,k,3)=b;
	end
end
figure(2);
imshow(image_rgb);
imwrite(image_rgb,'peppers_rgb_from_yiq.png');