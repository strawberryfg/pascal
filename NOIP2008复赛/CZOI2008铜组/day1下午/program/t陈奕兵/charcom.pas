var i,j,t,total,k,x,y:longint;
    a:string;
    n:array[1..26]of longint;
begin
assign(input,'charcom.out');
assign(output,'charcom.out');
reset(input);
rewrite(output);
readln(i);
readln(a);
n[1]:=1;
for j:=2 to i do
    n[j]:=n[j-1]*2;
for k:=1 to length(a) do
    begin
    y:=1;
    x:=ord(a[k])-64;
    for t:=1 to k-1 do
        y:=y*2;
    total:=total+(n[x] div y);
    end;
writeln(total);
close(input);
close(output);
end.