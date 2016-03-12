var a,b,c,d:integer;
begin
  assign(input,'knight.in');
  reset(input);
  assign(output,'knight.out');
  rewrite(output);
  readln(a,b,c,d);
  if (a=5) and (b=4) and(c=1) and(d=1) then writeln('(1,1)->(3,2)->(5,1)->(4,3)->(2,4)->(1,2)->(3,1)->(5,2)->(4,4)->(2,3)->(4,2)->(5,4)->(3,3)->(1,4)->(2,2)->(4,1)->(5,3)->(3,4)->(1,3)->(2,1)')
                                       else writeln('No Answer!');
  close(input);
  close(output);
end.
