function [h, s, v] = rgbtohsv(r, g, b)
	r_d = double(r);
	g_d = double(g);
	b_d = double(b);
	r_d = r_d / 255; 
	g_d = g_d / 255; 
	b_d = b_d / 255;
	
	Cmax = max(max(r_d,g_d),b_d);
	Cmin = min(min(r_d,g_d),b_d);
	delta = Cmax - Cmin;
	
	h_d = 0;
	v_d = Cmax;
	s_d = delta;
	
	if Cmax == 0,
		s_d = 0;
	else
		s_d = delta / Cmax;
	end
	
	if delta == 0,
		h_d = 0;
	elseif r_d == Cmax,
		h_d = (g_d - b_d) / delta;
	elseif g_d == Cmax,
		h_d = 2 + (b_d - r_d) / delta;
	elseif b_d == Cmax,
		h_d = 4 + (r_d - g_d) / delta;
	end
	
	h_d = h_d / 6;
	if h_d < 0,
		h_d = h_d + 1;
	end
	
	h=uint8(h_d*255);
	s=uint8(s_d*255);
	v=uint8(v_d*255);
end