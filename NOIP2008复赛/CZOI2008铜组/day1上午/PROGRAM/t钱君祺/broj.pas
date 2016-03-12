var x,n:longint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(n);
  if n<10 then x:=n;
  if (n>10)and (n<100) then x:=(n-10+1)*2+9;
  if (n>100)and (n<1000) then x:=(n-100+1)*3+189;
  if (n>1000)and (n<10000) then x:=(n-1000+1)*4+2889;
  if (n>10000)and (n<100000) then x:=(n-10000+1)*5+38889;
  if (n>100000)and (n<1000000) then x:=(n-100000+1)*6+488889;
  if (n>1000000)and (n<10000000) then x:=(n-1000000+1)*7+5888889;
  if (n>10000000)and (n<100000000) then x:=(n-10000000+1)*8+68888889;
  if (n=100000000) then x:=788888898;
  writeln(x);
  close(input);
  close(output);
end.
