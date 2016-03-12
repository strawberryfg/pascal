type arr=array[0..100]of longint;
var a,b:arr;
    i,sum,j,ls,n,d:longint;
    s:string;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(s);
d:=1;
ls:=length(s);
for i:=1 to n do
    begin
    a[i]:=d;
    d:=d*2;
    end;
a[0]:=0;
sum:=0;
for i:=1 to ls do
    for j:=1 to n do
        if ord(s[i])-64=j then
           sum:=sum+a[j-1];
writeln(sum+1);
close(input);
close(output);
end.
