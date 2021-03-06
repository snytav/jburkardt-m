function value = r4_erfc ( x )

%*****************************************************************************80
%
%% R4_ERFC evaluates the co-error function of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the co-error function of X.
%
  persistent erfccs
  persistent erfcs
  persistent erc2cs
  persistent nterc2
  persistent nterf
  persistent nterfc
  persistent sqeps
  persistent sqrtpi
  persistent xmax
  persistent xsml

  sqrtpi = 1.7724538509055160;

  if ( isempty ( nterf ) )

    erc2cs = [ ...
     -0.069601346602309501E+00, ...
     -0.041101339362620893E+00, ...
      0.003914495866689626E+00, ...
     -0.000490639565054897E+00, ...
      0.000071574790013770E+00, ...
     -0.000011530716341312E+00, ...
      0.000001994670590201E+00, ...
     -0.000000364266647159E+00, ...
      0.000000069443726100E+00, ...
     -0.000000013712209021E+00, ...
      0.000000002788389661E+00, ...
     -0.000000000581416472E+00, ...
      0.000000000123892049E+00, ...
     -0.000000000026906391E+00, ...
      0.000000000005942614E+00, ...
     -0.000000000001332386E+00, ...
      0.000000000000302804E+00, ...
     -0.000000000000069666E+00, ...
      0.000000000000016208E+00, ...
     -0.000000000000003809E+00, ...
      0.000000000000000904E+00, ...
     -0.000000000000000216E+00, ...
      0.000000000000000052E+00 ]';
    erfccs = [ ...
      0.0715179310202925E+00, ...
     -0.026532434337606719E+00, ...
      0.001711153977920853E+00, ...
     -0.000163751663458512E+00, ...
      0.000019871293500549E+00, ...
     -0.000002843712412769E+00, ...
      0.000000460616130901E+00, ...
     -0.000000082277530261E+00, ...
      0.000000015921418724E+00, ...
     -0.000000003295071356E+00, ...
      0.000000000722343973E+00, ...
     -0.000000000166485584E+00, ...
      0.000000000040103931E+00, ...
     -0.000000000010048164E+00, ...
      0.000000000002608272E+00, ...
     -0.000000000000699105E+00, ...
      0.000000000000192946E+00, ...
     -0.000000000000054704E+00, ...
      0.000000000000015901E+00, ...
     -0.000000000000004729E+00, ...
      0.000000000000001432E+00, ...
     -0.000000000000000439E+00, ...
      0.000000000000000138E+00, ...
     -0.000000000000000048E+00 ]';
    erfcs = [ ...
     -0.049046121234691808E+00, ...
     -0.14226120510371364E+00, ...
      0.010035582187599796E+00, ...
     -0.000576876469976748E+00, ...
      0.000027419931252196E+00, ...
     -0.000001104317550734E+00, ...
      0.000000038488755420E+00, ...
     -0.000000001180858253E+00, ...
      0.000000000032334215E+00, ...
     -0.000000000000799101E+00, ...
      0.000000000000017990E+00, ...
     -0.000000000000000371E+00, ...
      0.000000000000000007E+00 ]';

    eta = 0.1 * r4_mach ( 3 );
    nterf = r4_inits ( erfcs, 13, eta );
    nterfc = r4_inits ( erfccs, 24, eta );
    nterc2 = r4_inits ( erc2cs, 23, eta );

    xsml = - sqrt ( - log ( sqrtpi * r4_mach ( 3 ) ) );
    xmax = sqrt ( - log ( sqrtpi * r4_mach ( 1 ) ) );
    xmax = xmax - 0.5 * log ( xmax ) / xmax - 0.01;
    sqeps = sqrt ( 2.0 * r4_mach ( 3 ) );

  end

  if ( x <= xsml )

    value = 2.0;
    return

  end

  if ( xmax < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_ERFC - Warning!\n' );
    fprintf ( 1, '  X so big that ERFC underflows.\n' );
    value = 0.0;
    return
  end

  y = abs ( x );

  if ( y < sqeps )
    value = 1.0 - 2.0 * x / sqrtpi;
    return
  elseif ( y <= 1.0 )
    value = 1.0 - x * ( 1.0 + r4_csevl ( 2.0 * x * x - 1.0, erfcs, nterf ) );
    return
  end

  y = y * y;

  if ( y <= 4.0 )
    value = exp ( - y ) / abs ( x ) * ( 0.5 ...
      + r4_csevl ( ( 8.0 / y - 5.0 ) / 3.0, erc2cs, nterc2 ) );
  else
    value = exp ( - y ) / abs ( x ) * ( 0.5 ...
      + r4_csevl ( 8.0 / y - 1.0, erfccs, nterfc ) );
  end

  if ( x < 0.0 )
    value = 2.0 - value;
  end

  return
end
