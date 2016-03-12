var n,i,s,ans:longint;a:array[0..100000]of longint;
begin
assign(input,'sugar.in');
assign(output,'sugar.out');
reset(input);
rewr
ite(output);
readln(n);
a[0]:=1;
a[1]:=3;
a[2]:=6;
a[3]:=10;
a[4]:=15;
for i:=5 to n do
    begin
    ans:=10;
    s:=i;
    while s>=2 do
         begin
         ans:=ans+a[s-2];
         s:=s-2;
         end;
    s:=i;
    while s>=5 do
         begin
         ans:=ans+a[s-5];
         s:=s-5;
         end;
    a[i]:=ans;
    end;
writeln(a[n]);
close(output);
close(input);
end.
