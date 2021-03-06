function [ a, more ] = vec_lex_next ( dim_num, base, a, more )

%*****************************************************************************80
%
%% VEC_LEX_NEXT generates vectors in lex order.
%
%  Discussion:
%
%    The vectors are produced in lexical order, starting with
%    (0,0,...,0),
%    (0,0,...,1),
%    ...
%    (BASE-1,BASE-1,...,BASE-1).
%
%  Examples:
%
%    DIM_NUM = 2,
%    BASE = 3
%
%    0   0
%    0   1
%    0   2
%    1   0
%    1   1
%    1   2
%    2   0
%    2   1
%    2   2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer, 1986,
%    ISBN: 0387963472,
%    LC: QA164.S79.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the size of the vectors to be used.
%
%    Input, integer BASE, the base to be used.  BASE = 2 will
%    give vectors of 0's and 1's, for instance.
%
%    Input, integer A(DIM_NUM), except on the first call, this should
%    be the output value of A on the last call.
%
%    Input, logical MORE, should be FALSE on the first call, and
%    thereafter should be the output value of MORE from the previous call.  
%
%    Output, integer A(DIM_NUM), the next vector.
%
%    Output, logical MORE, is TRUE if another vector was computed.
%    If MORE is FALSE on return, then ignore the output value A, and
%    stop calling the routine.
%
  if ( ~more )

    a(1:dim_num) = 0;
    more = 1;

  else
      
    for i = dim_num : -1 : 1

      a(i) = a(i) + 1;

      if ( a(i) < base )
        return
      end

      a(i) = 0;

    end

    more = 0;

  end

  return
end
