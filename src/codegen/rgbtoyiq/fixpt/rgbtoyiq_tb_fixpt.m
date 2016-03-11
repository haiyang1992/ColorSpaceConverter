image_rgb = imread( 'lena.jpg' );
figure( 1 );
imshow( image_rgb );
image_yiq = uint8( zeros( 100, 100, 3 ) );
for j = 1:100
    for k = 1:100
        [y,i,q] = rgbtoyiq_wrapper_fixpt( image_rgb( j, k, 1 ), image_rgb( j, k, 2 ), image_rgb( j, k, 3 ) );
        image_yiq( j, k, 1 ) = y;
        image_yiq( j, k, 2 ) = i;
        image_yiq( j, k, 3 ) = q;
    end
end
figure( 2 );
imshow( image_yiq );
