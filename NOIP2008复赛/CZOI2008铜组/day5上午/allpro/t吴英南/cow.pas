var a:array[1..4]of int64;
    n,i,j:longint;
    temp:int64;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
a[1]:=1;
for i:=1 to n do
    begin
    temp:=a[4];
    a[4]:=a[4]+a[3];
    for j:=3 downto 2 do
        a[j]:=a[j-1];
    a[1]:=temp;
    end;
writeln(a[1]+a[2]+a[3]+a[4]);
close(input);
close(output);
end.