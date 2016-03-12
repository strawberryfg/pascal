const maxn=6000;
var lena,lenb,i,j,m,ans:longint;
    f,tf,a,b:array[0..maxn]of longint;
begin
assign(input,'lics.in');
reset(input);
assign(output,'lics.out');
rewrite(output);
read(lena,lenb);
for i:=1 to lena do read(a[i]);
readln;
for i:=1 to lenb do read(b[i]);
for i:=1 to lena do
    begin
    m:=0;
    tf:=f;
    for j:=1 to lenb do
        begin
        if a[i]=b[j] then tf[j]:=m+1;
        if b[j]<=a[i] then
           begin
           if f[j]>m then m:=f[j];
           end;
        end;
    f:=tf;
    end;
ans:=0;
for i:=1 to lenb do
    if f[i]>ans then ans:=f[i];
writeln(ans);
close(input);
close(output);
end.
