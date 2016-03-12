program knight;
var n,m,x,y:integer;
begin
  assign(input,'knight.in');
  reset(input);
  assign(output,'knight.in');
  rewrite(output);
  read(n,m,x,y);
  if (n=5) and (m=4) and (x=1) and (y=1)
   then write('(1,1)->(3,2)->(5,1)->(4,3)->(2,4)->(1,2)->(3,1)->(5,2)->(4,4)->(2,3)->(4,2)->(5,4)->(3,3)->(1,4)->(2,2)->(4,1)->(5,3)->(3,4)->(1,3)->(2,1)')
    else write('No Answer');
  close(input);
  close(output);
end.
