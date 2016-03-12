{
ID: xiaweiy1
PROG: gift1
LANG: PASCAL
}
Program Test;
const maxn=10;
var name:array[1..maxn]of string;
    money:array[1..maxn]of longint;
    get:array[1..maxn]of longint;
    i,j,k,m,n,t,np:longint;
    s:string;
function search(r:string):longint;
var i:longint;
begin
i:=0;
for i:=1 to np do
    if name[i]=r then begin search:=i;exit; end;{name(i)是原数组中的人名，如果等于后来读入的人名，那么i就是该人名在数组中的位置}
end;
begin
assign(input,'gift1.in');
reset(input);
assign(output,'gift1.out');
rewrite(output);
readln(np);
for i:=1 to np do
    readln(name[i]);
for i:=1 to np do
    begin
    readln(s);
    readln(m,n);
    j:=search(s);{因为这时候读入的人名与一开始时可能不一样，所以用一个函数寻找该人名在原数组（name)中的位置}
    money[j]:=money[j]+m;
    for k:=1 to n do
        begin
        readln(s);
        t:=search(s);
        get[t]:=get[t]+m div n;{得钱}
        end;
    if (n<>0)and(money[j]mod n<>0) then money[j]:=money[j] div n*n
    end;
for i:=1 to np do
    writeln(name[i],' ',get[i]-money[i]);
close(input);
close(output);
end.