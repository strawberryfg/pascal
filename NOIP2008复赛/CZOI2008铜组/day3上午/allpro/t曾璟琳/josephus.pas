var k,m,t,i,f,s:longint;
   a:array[1..100000]of longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(k);
m:=1;
while m<=100000 do
 begin
  f:=-1;
  s:=0;
  for i:=1 to k*2 do
    a[i]:=1;
  while (f=-1) do
  begin
  t:=0;
  while t<m do
    begin
     inc(i);
     if i>k*2 then i:=i mod (k*2);
     t:=t+a[i];
     if t=m then break;
    end;
   if i>k*2 then i:=i mod (k*2);
   if i<k+1 then begin f:=0;a[i]:=0;end;
   if f=-1 then begin inc(s);a[i]:=0;end;
   if s=k then begin writeln(m);close(input);close(output);exit;end;
  end;
 inc(m);
 end;
end.