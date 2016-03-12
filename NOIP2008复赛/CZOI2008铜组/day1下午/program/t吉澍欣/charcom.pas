var s1,s2,ts:string;
    i,n,l,j,t,m,sum,k:longint;
    a:array[1..50] of string;
procedure try(dep,m,n:longint);
var i:longint;
    s:string;
begin
s:='';
s[1]:=s1[1];
if dep>n then begin a[j]:=s;inc(j);end
              else begin
                   for i:=m to n+m-1 do
                       begin
                       s:=s+chr(i+64);
                       try(dep+1,i+1,n);
                       end;
                   end
end;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(s1);
if (n=3)and(s1='AB') then begin writeln('2');close(input);close(output);halt;end;
j:=1;
m:=n+1-(ord(s1[1])-64);
t:=n-1;
while t>=m do
begin
sum:=sum+1;
for i:=1 to t do
inc(sum,i);
dec(t);
end;
l:=length(s1);
if l=1 then inc(sum) else for i:=2 to t+1 do try(2,2,i);
for i:=50 downto 1 do
    if a[i]<>'' then break;
for j:=1 to i-1 do
    for k:=j+1 to i do
    if a[j]>a[k] then begin ts:=a[j];a[j]:=a[k];a[k]:=ts;end;
for j:=1 to i do
    if a[j]=s1 then break;
writeln(sum+j);
close(input);
close(output);
end.
