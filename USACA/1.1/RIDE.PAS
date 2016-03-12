{
ID: xiaweiy1
PROG:ride 
LANG: PASCAL
}
var a,b:string;
    m,n,i:longint;
begin
assign(input,'ride.in');
reset(input);
assign(output,'ride.out');
rewrite(output);
readln(a);
readln(b);
m:=1;
n:=1;
for i:=1 to length(a) do
    m:=m*(ord(a[i])-64);
for i:=1 to length(b) do
    n:=n*(ord(b[i])-64);
if m mod 47=n mod 47 then writeln('GO')
                     else writeln('STAY');
close(input);
close(output);
end.