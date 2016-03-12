label a,b;
var n,k,temp,i1,i2:integer;
    know:packed array[1..10000]of integer;
begin
assign(input,'knum.in');
assign(output,'knum.out');
reset(input);
read(n,k);
for i1:=1 to n do read(know[i1]);
close(input);
if k>n div 2 then goto a;
for i1:=1 to k do
    for i2:=i1+1 to n do
        if know[i1]<know[i2] then
           begin
           temp:=know[i1];
           know[i1]:=know[i2];
           know[i2]:=temp;
           end;
goto b;
a:
for i1:=1 to n-k+1 do
    for i2:=i1+1 to n do
        if know[i1]>know[i2] then
           begin
           temp:=know[i1];
           know[i1]:=know[i2];
           know[i2]:=temp;
           end;
rewrite(output);
writeln(know[n-k+1]);
close(output);
halt;
b:
rewrite(output);
writeln(know[k]);
close(output);
end.
