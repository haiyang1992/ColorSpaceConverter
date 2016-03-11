function [r_u, g_u, b_u] = hsvtorgb(h, s, v)
	h_d=double(h);
	s_d=double(s);
	v_d=double(v);
	h_d=h_d/255;
	s_d=s_d/255;
	v_d=v_d/255;
	
	h_d = h_d*6;
	i=floor(h_d);
	f = h_d-i;
	p = v_d*(1-s_d);
	q = v_d*(1-s_d*p);
	t = v_d*(1-(s_d*(1-p)));

	switch i
		case 0
			r = v_d;
			g = t;
			b = p;
		case 1
			r = q;
			g = v_d;
			b = p;
		case 2
			r = p;
			g = v_d;
			b = t;
		case 3
			r = p;
			g = q;
			b = v_d;
		case 4
			r = t;
			g = p;
			b = v_d;
		case 5
			r = v_d;
			g = p;
			b = q;
		otherwise
			r = v_d;
			g = t;
			b = p;
	end

	r_u = uint8(r*255);
	g_u = uint8(g*255);
	b_u = uint8(b*255);
end