%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%#codegen
function [r_u,g_u,b_u] = hsvtorgb_fixpt(h,s,v)

fm = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');
h_d = fi(double( h ), 0, 14, 6, fm);
s_d = fi(double( s ), 0, 14, 5, fm);
v_d = fi(double( v ), 0, 14, 5, fm);
h_d = fi(h_d*fi(1/255, 0, 14, 21, fm), 0, 14, 6, fm);
s_d = fi(s_d*fi(1/255, 0, 14, 21, fm), 0, 14, 5, fm);
v_d = fi(v_d*fi(1/255, 0, 14, 21, fm), 0, 14, 5, fm);
h_d = fi(h_d*fi(6, 0, 3, 0, fm), 0, 14, 6, fm);
i = fi(floor( h_d ), 0, 3, 0, fm);
f = fi(h_d - i, 0, 14, 13, fm);
p = fi(v_d*(fi(1, 0, 1, 0, fm) - s_d), 0, 14, 13, fm);
q = fi(v_d*(fi(1, 0, 1, 0, fm) - s_d*p), 0, 14, 13, fm);
t = fi(v_d*(fi(1, 0, 1, 0, fm) - (s_d*(fi(1, 0, 1, 0, fm) - p))), 0, 14, 13, fm);
switch i
    case 0
        r = fi(v_d, 0, 14, 13, fm);
        g = fi(t, 0, 14, 13, fm);
        b = fi(p, 0, 14, 13, fm);
    case 1
        r = fi(q, 0, 14, 13, fm);
        g = fi(v_d, 0, 14, 13, fm);
        b = fi(p, 0, 14, 13, fm);
    case 2
        r = fi(p, 0, 14, 13, fm);
        g = fi(v_d, 0, 14, 13, fm);
        b = fi(t, 0, 14, 13, fm);
    case 3
        r = fi(p, 0, 14, 13, fm);
        g = fi(q, 0, 14, 13, fm);
        b = fi(v_d, 0, 14, 13, fm);
    case 4
        r = fi(t, 0, 14, 13, fm);
        g = fi(p, 0, 14, 13, fm);
        b = fi(v_d, 0, 14, 13, fm);
    case 5
        r = fi(v_d, 0, 14, 13, fm);
        g = fi(p, 0, 14, 13, fm);
        b = fi(q, 0, 14, 13, fm);
    otherwise
        r = fi(v_d, 0, 14, 13, fm);
        g = fi(t, 0, 14, 13, fm);
        b = fi(p, 0, 14, 13, fm);
end
r_u = fi(uint8( r*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
g_u = fi(uint8( g*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
b_u = fi(uint8( b*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
end
