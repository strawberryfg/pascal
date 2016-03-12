const maxn=256;
var x,y:string;
    tmp:char;
    r,i,j,t,tt:longint;
    ind:array[1..maxn]of longint;
    ss:array[1..maxn]of char;
begin
assign(input,'bw.in');
reset(input);
assign(output,'bw.out');
rewrite(output);
readln(y);
readln(r);
x:=y;
for i:=1 to length(x) do ind[i]:=i;
for i:=1 to length(x)-1 do
    begin
    for j:=i+1 to length(x) do
        begin
        if x[i]>x[j] then
           begin
           tt:=ind[i];
           ind[i]:=ind[j];
           ind[j]:=tt;
           tmp:=x[i];
           x[i]:=x[j];
           x[j]:=tmp;
           end;
        end;
    end;
ss[1]:=x[r]; ss[length(y)]:=y[r];
t:=r;
for i:=1 to length(y)-2 do
    begin
    t:=ind[t];
    ss[i+1]:=x[t];
    end;
for i:=1 to length(y) do write(ss[i]);
writeln;
close(input);
close(output);
end.