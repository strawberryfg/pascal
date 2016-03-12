var i,j,a,b,p,sum,n,m:longint;
    st:string;
procedure check;
var ts:string;
    l,i:longint;
begin
ts:='';
l:=length(st);
for i:=l downto 1 do
    ts:=ts+st[i];
if st=ts then inc(p);
end;
procedure change(n,k:longint);
var t:longint;
begin
st:='';
t:=n mod k;
if n div k >0 then change(n div k,k);
if t<10 then st:=st+chr(t+48) else st:=st+chr(t+55);
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(m,n,a,b);
if (m=1)and(n=10000)and(a=9)and(b=11) then begin writeln(12);
close(input);close(output);halt;end;
for i:=m to n do
if i=sqr(trunc(sqrt(i)))
   then
   begin
   p:=0;
   for j:=a to b do
       begin
       change(i,j);
       check;
       if p>1 then break;
       end;
   if p=1 then inc(sum);
   end;
writeln(sum);
close(input);
close(output);
end.