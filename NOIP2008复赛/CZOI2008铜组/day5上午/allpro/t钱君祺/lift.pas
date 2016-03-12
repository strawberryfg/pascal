var n,a,b,min,t,i:longint;
    k,f:array[1..500]of longint;
function lift1(a,b:longint):longint;
var i,p:longint;
begin
    p:=0;
 while min=0 do begin
    f[1]:=a+k[a];
    f[2]:=a-k[a];
    inc(p);
    if ((f[1]=b)or (f[2]=b))and(t<min) then p:=t
                           else for i:=1 to 2 do if (f[i]<>b) and(f[i]>0) then lift1(f[i],b);
 end;
 lift1:=p;
end;
begin
  assign(input,'lift.in');
  assign(output,'lift.out');
  reset(input);
  rewrite(output);
  readln(n,a,b);
  for i:=1 to n do read(k[i]);
  t:=0;
  min:=0;
  min:=lift1(a,b);
  if min=0 then writeln('-1')
           else writeln(min);
  close(input);
  close(output);
end.