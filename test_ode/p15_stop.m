function [ t_stop, y_stop ] = p15_stop ( neqn )

%*****************************************************************************80
%
%% P15_STOP returns the stopping point for problem p15.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Output, real T_STOP, Y_STOP(NEQN), the final data.
%
  y_stop = zeros ( neqn, 1 );

  t_stop = 20.0;
  y_stop = [ ...
   -4.792730224323733; ...
   -2.420550725448973; ...
   -9.212509306014886e-01; ...
   -4.217310404035213; ...
    7.356202947498970; ...
    3.223785985421212; ...
    4.035559443262270; ...
    1.719865528670555e+01; ...
    7.478910794233703; ...
   -2.998759326324844e+01; ...
   -4.107310937550929; ...
   -9.277008321754407e-01; ...
   -2.442125302518482e+01; ...
    2.381459045746554e+01; ...
    1.492096306951359e+01; ...
    3.499208963063806e-01; ...
   -5.748487687912825e-01; ...
   -2.551694020879149e-01; ...
   -5.237040978903326e-01; ...
   -2.493000463579661e-01; ...
   -8.045341642044464e-02; ...
   -3.875289237334110e-01; ...
    5.648603288767891e-02; ...
    3.023606472143342e-02; ...
    4.133856546712445e-02; ...
   -2.862393029841379e-01; ...
   -1.183032405136207e-01; ...
   -1.511986457359206e-01; ...
   -2.460068894318766e-01; ...
   -3.189687411323877e-02 ];

  return
end
