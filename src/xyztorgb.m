function [r, g, b] = xyztorgb(x, y, z)
	r=uint8(2.0413690*x-0.5649464*y-0.3446944*z);
    g=uint8(-x+1.8760108*y+0.0415560*z);
    b=uint8(0.0134474*x-0.1183897*y+1.0154096*z);
end