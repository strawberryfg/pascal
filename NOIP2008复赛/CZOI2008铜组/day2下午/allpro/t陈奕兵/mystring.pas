var a,b,c:string;
    i,j,k,x,y,g:longint;
    n:array[1..500]of string;
begin
{assign(input,'mystring.in');
assign(output,'mystring.out');
reset(input);
rewrite(output);}
readln(a);
g:=length(a);
for x:=1 to g do
    n[x]:='';
i:=1;
for x:=1 to g do
    if a[x]=' ' then inc(i)
                else n[i]:=n[i]+a[x];
x:=length(n[1]);
b:=n[1];
y:=length(n[1]);
c:=n[1];
for k:=2 to i do
    begin
    if length(n[k])>x then begin x:=length(n[k]);b:=n[k];end;
    if length(n[k])<y then begin y:=length(n[k]);c:=n[k];end;
    end;
write(b);
writeln;
write(c);
{close(input);
close(output);}
end.