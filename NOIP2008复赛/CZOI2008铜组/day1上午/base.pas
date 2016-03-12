var b,e,bj,ej,sum,i,m,n,tt:longint;
function hw(t:string):boolean;
var i:longint;
begin
hw:=true;
for i:=1 to length(t) div 2 do
    if t[i]<>t[length(t)+1-i] then begin hw:=false;exit; end;
end;
function pd(n,a,b:longint):boolean;
var i,j,t:longint;
    s:string;
begin
pd:=true;
j:=0;
for i:=a to b do
    begin
    t:=n; s:='';
    while t<>0 do
          begin
          s:=char(t mod i+48)+s;
          t:=t div i;
          end;
    if hw(s) then inc(j);
    if j>1 then begin pd:=false;exit; end;
    end;
if j=0 then pd:=false;
if pd=true then tt:=i;
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(b,e,bj,ej);
m:=trunc(sqrt(b));
n:=trunc(sqrt(e));
for i:=m to n do
    if pd(i*i,bj,ej) then inc(sum);
writeln(sum);
close(input);
close(output);
end.
