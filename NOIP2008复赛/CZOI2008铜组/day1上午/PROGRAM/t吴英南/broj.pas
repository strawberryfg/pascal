var i,n,a,j,k,l:longint;
        s:int64;
begin
{assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);}
read(n);
a:=1;
s:=0;
k:=1;
l:=1;
for i:=1 to n do
    begin
    if i mod(l*10) =0 then begin inc(a);l:=l*10;end;
    s:=s+a;
    end;
writeln(s);
close(input);
close(output);
end.
