{
ID: xiaweiy1
PROG: stamps
LANG: PASCAL
}
const maxn=2000000;
var n,k,i,j,t,fmin:longint;
    f:array[0..maxn+2]of longint;
    num:array[1..50]of longint;
begin
assign(input,'stamps.in');
reset(input);
assign(output,'stamps.out');
rewrite(output);
readln(k,n);
for i:=1 to n do
    begin
    read(num[i]);
    end;
for i:=1 to maxn+1 do
    begin
     fmin:=maxlongint;
    for j:=1 to n do
        begin
        t:=i-num[j];

        if t>=0 then
           begin
           if f[t]<fmin then fmin:=f[t];
           end;
        end;
    f[i]:=fmin+1;
    if f[i]>k then break;
    end;
writeln(i-1);
close(input);
close(output);
end.