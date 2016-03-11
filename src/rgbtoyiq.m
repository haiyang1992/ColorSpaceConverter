function [y, i, q] = rgbtoyiq(r, g, b)
	y=uint8(0.2989*r+0.5870*g+0.1140*b);
    i=uint8(0.596*r-0.274*g-0.322*b);
    q=uint8(0.211*r-0.523*g+0.312*b);
end