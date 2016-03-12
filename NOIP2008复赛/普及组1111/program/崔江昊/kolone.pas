var a:array[1..1000] of char; b:array[1..1000] of boolean;
n,x,i,j,s:longint; o:boolean;    t:char;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n,x);

x:=x+n;
for i:=n downto 1 do
begin
read(a[i]);
b[i]:=true;
end;
readln;
for i:=n+1 to x do
begin
read(a[i]);
b[i]:=false;
end;
readln(n);
for i:=1 to n do
   for j:=1 to x-1 do
   if s=0 then    begin
   if (b[j]=true) and (b[j+1]=false) then
     begin
     t:=a[j]; a[j]:=a[j+1]; a[j+1]:=t;
     o:=b[j]; b[j]:=b[j+1]; b[j+1]:=o;
     s:=1;
     end; end else s:=0;
   for i:=1 to x do
   write(a[i]);
close(input);
close(output);
end.