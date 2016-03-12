var n,k,i,j,t,l:longint;
s,min:int64;
a:array[1..200]of longint;
c,d:array[1..200000]of longint;
begin
assign(input,'panda.in');
assign(output,'panda.out');
reset(input);
rewrite(output);
readln(n,k);
for i:=1 to n do
read(a[i]);
c[1]:=1;
l:=1;
for i:=1 to n do
d[i]:=1;
for i:=1 to k do
begin
min:=maxlongint;
for j:=1 to n do
begin
s:=a[j]*c[d[j]];
if s=c[l] then begin inc(d[j]);s:=a[j]*c[d[j]];if s<min then begin min:=s;t:=j;end;end else begin
if s<min then begin min:=s;t:=j;end;
end;
end;
inc(l);
c[l]:=min;
inc(d[t]);
end;
writeln(c[k+1]);
close(input);
close(output);
end.
