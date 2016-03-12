{var
1
12
123 2 4
131
2   2
23
3  1
   7
11       1
12
123               1

1234 2
124 1   4
13
134   2     8
14   1
2
23
234 2
24 1
3
34
4
16
1
12
123 }
var  n,i,s,t,j:longint;
     a:array[1..26] of longint;
     n1:string;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(n1);
t:=1;
for i:=1 to n do
begin
s:=s+t;
t:=t*2;
end;
for i:=1 to length(n1) do
a[i]:=ord(n1[i])-64;
a[i+1]:=a[i];
i:=1;
while i<=length(n1)+1 do
begin
t:=1;
for j:=n downto a[i]+1 do
begin
s:=s-t;
t:=t*2;
end;
i:=i+1;
end;
writeln(s);
close(input);
close(output);
end.
