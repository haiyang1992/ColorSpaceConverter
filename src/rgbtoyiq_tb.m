image_rgb=imread('peppers.png');
figure(1);
imshow(image_rgb);
image_yiq=uint8(zeros(size(image_rgb)));
for j=1:size(image_rgb,1)
	for k=1:size(image_rgb,2)
		[y, i, q]=rgbtoyiq(image_rgb(j,k,1),image_rgb(j,k,2),image_rgb(j,k,3));
		image_yiq(j,k,1)=y;
		image_yiq(j,k,2)=i;
		image_yiq(j,k,3)=q;
	end
end
figure(2);
imshow(image_yiq);
imwrite(image_yiq,'peppers_yiq.png');