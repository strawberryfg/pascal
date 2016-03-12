var n,d,total:longint;s:string;
function pd(q,h:longint):boolean;
var nh,nj,j:longint;
begin
nh:=0;nj:=0;
pd:=false;
for j:=q to h do
    if s[j]='H' then inc(nh) else inc(nj);
if (abs(nh-nj)<=d)or(nj=0)or(nh=0)then
   pd:=true;
end;
procedure try(a:longint);
var t,i:longint;
begin
if a>n then exit;
t:=1;
for i:=a+1 to n do
    if pd(a,i)=true then t:=i;
total:=total+1;
try(t+1);
end;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);rewrite(output);
readln(n,d);
readln(s);
try(1);
writeln(total);
close(input);close(output);
end.
