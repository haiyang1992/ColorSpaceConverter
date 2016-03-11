function [r, g, b] = yiqtorgb(y, i, q)
	r=uint8(1*y+0.956*i+0.621*q);
    g=uint8(1*y-0.272*i-0.647*q);
    b=uint8(1*y-1.105*i+1.702*q);
end