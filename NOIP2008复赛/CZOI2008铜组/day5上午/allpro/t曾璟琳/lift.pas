var a1,n,a,i,b,p,w,j:longint;
    k,r:array[1..1000]of longint;
begin
assign(input,'life.in');
reset(input);
assign(output,'life.out');
rewrite(output);
readln(n,a,b);
for i:=1 to n-1 do
   read(k[i]);
readln(k[n]);
p:=0;
a1:=a;
while a<>b do
begin
 a1:=a1+k[a];
 if a1>n then a:=a-k[a]
 else if a1<0 then a:=a+k[a]
 else a:=a+k[a];
 a1:=a;
 for w:=1 to j do
   if r[w]=a1 then begin writeln('-1');close(input);close(output);exit;end;
 inc(j);
 r[j]:=a1;
 inc(p);
end;
writeln(p);
close(input);
close(output);
end.