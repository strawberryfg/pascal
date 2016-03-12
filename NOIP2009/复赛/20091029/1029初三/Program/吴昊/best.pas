var n,i,l1,x:longint;
    a:array[1..500] of longint;
procedure gc(n:longint);
var i:longint;
begin
for i:=1 to l1 do
    a[i]:=a[i]*n;
for i:=1 to l1+1 do
    begin
    a[i+1]:=a[i+1]+(a[i] div 10);
    a[i]:=a[i] mod 10;
    end;
if a[l1+2]<>0 then inc(l1,2)
              else if a[l1+1]<>0 then inc(l1,1);
end;
begin
assign(input,'best.in');reset(input);
assign(output,'best.out');rewrite(output);
read(n);
x:=2;
while n>x do
begin
n:=n-x;
x:=x+1;
end;
x:=x-1;
a[1]:=1;
l1:=1;
if x-1<n then
         begin
         for i:=2 to x do
             if i=2 then gc(i+n)
                    else gc(i);
         end
         else
         begin
         for i:=2 to x do
             if x-i+1=n then gc(i+n)
                        else gc(i);
         end;
for i:=l1 downto 1 do
    write(a[i]);
writeln;
close(input);
close(output);
end.
