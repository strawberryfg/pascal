var n1,n2:string;
    t,i,j,k:longint;
   a,b:array[1..70] of string;
function pd(c:char):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to length(n2) do
    if c=n2[i] then begin pd:=false;exit; end;
    n2:=n2+c;
end;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
n2:='AEIOU';
readln(n1);
t:=1;
for i:=1 to 70 do
    begin
    a[i]:='';
    b[i]:='';
    end;
for i:=1 to length(n1) do
begin
if n1[i]=' ' then BEGIN t:=t+1;I:=I+1;END;
a[t]:=a[T]+n1[i];
end;
for i:=1 to t do
    begin
    for j:=1 to length(a[i]) do
        if pd(a[i,j]) then b[i]:=b[i]+a[i,j];
    end;

    for i:=1 to t-1 do
    if not(b[i]='') then
    write(b[i],' ');
    if not(b[t]='') then write(b[t]);
close(input);
close(output);
end.
