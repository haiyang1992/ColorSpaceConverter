%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [r_u,g_u,b_u] = hsvtorgb_wrapper_fixpt(h,s,v)
    fm = fimath( 'RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision' );
    h_in = fi( h, 0, 8, 0, fm );
    s_in = fi( s, 0, 8, 0, fm );
    v_in = fi( v, 0, 8, 0, fm );
    [r_u_out,g_u_out,b_u_out] = hsvtorgb_fixpt( h_in, s_in, v_in );
    r_u = uint8( r_u_out );
    g_u = uint8( g_u_out );
    b_u = uint8( b_u_out );
end
