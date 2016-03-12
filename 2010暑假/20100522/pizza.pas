var n,i,a,b,c,p:longint;
    s:string;
    t:real;
begin
assign(input,'pizza.in');
reset(input);
assign(output,'pizza.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(s);
    if s='1/4' then inc(a)
       else if s='3/4' then inc(b)
            else inc(c);
    end;
a:=a-b;
if a<0 then a:=0;
t:=1/4*a+1/2*c;
p:=trunc(t);
if t>p then inc(p);
writeln(p+b);
close(input);
close(output);
end.