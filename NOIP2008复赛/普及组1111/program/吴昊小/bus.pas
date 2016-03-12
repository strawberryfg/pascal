var n,d,i,h,j:longint;
    s:string;
begin
  assign(input,'bus.in');
  reset(input);
  assign(output,'bus.out');
  rewrite(output);
  readln(n,d);
  readln(s);
  h:=0;
  j:=0;
  for i:=1 to n do
    if s[i]='H' then inc(h) else inc(j);
  if (j=0) or (h=0) or (abs(h-j)<=d) then begin writeln('1');close(input);close(output);halt end;
  writeln('2');
  close(input);
  close(output);
end.
