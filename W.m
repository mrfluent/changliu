function y = W(x, p, percentile)

%   absx = abs(x);
%   mask = (absx >= epsf);
%   y =  ( (mask.*absx) + (1-mask)*epsf ).^(p-2) ;

  absx = abs(x);

  max_absx = max( absx(:) );
  min_absx = min( absx(:) );

  %find histogram between max and min.
  [h, bin] = hist(absx(:), min_absx: (max_absx-min_absx)/999 :max_absx);
  hacc = cumsum(h);

  [~, pos] = max( hacc/hacc(end) > percentile ); % 0 0 .. 0 1 1 .. 1
                                                    %         ^
                                                    %         | percentile
  epsf = bin(pos+1);

  mask = (absx >= epsf);
  y =   ( (mask.*absx) + (1-mask)*epsf ).^(p-2) ;

return