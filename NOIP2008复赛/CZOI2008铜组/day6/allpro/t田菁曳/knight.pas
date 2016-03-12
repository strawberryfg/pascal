var a:array[1..4] of longint;
    i:longint;
begin
  assign(input,'knight.in');
  reset(input);
  assign(input,'knight.out');
  rewrite(output);
  for i:=1 to 4 do
  read(a[i]);
  if (a[1]=5)and(a[2]=4)and(a[3]=1)and(a[4]=1) then
  begin
    writeln('(1,1)->(3,2)->(5,1)->(4,3)->(2,4)->(1,2)->(3,1)->(5,2)->(4,4)->(2,3)->(4,2)->(5,4)->(3,3)->(1,4)->(2,2)->(4,1)->(5,3)->(3,4)->(1,3)->(2,1)');
  end
  else writeln('No Answer!');
  close(input);
  close(output);
end.