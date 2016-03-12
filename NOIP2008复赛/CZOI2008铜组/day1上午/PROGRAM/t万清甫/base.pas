const jz:array[10..15]of char=('A','B','C','D','E','F');
var b,e,bj,ej,i,j,sum:longint;
function pf(s:string):boolean;
var t:string;
    p:longint;
    code:integer;
begin
pf:=true;
t:=s[length(s)];
if (t<>'0')and(t<>'1')and(t<>'4')and(t<>'5')and(t<>'6')and(t<>'9') then begin pf:=false;exit; end;
val(s,p,code);
if sqrt(p)-trunc(sqrt(p))>0 then pf:=false;
end;
function hw(s:string):boolean;
var i,l:longint;
begin
hw:=true;
l:=length(s);
for i:=1 to l div 2 do
    if s[i]<>s[l+1-i] then begin hw:=false;exit; end;
end;
function pd(n,a,b:longint):boolean;
var i,j,k,p:longint;
    t:string;
    code:integer;
begin
j:=0;
pd:=true;
for i:=a to b do
    begin
    t:='';
    if i=10 then str(n*n,t) else
            begin
            k:=n*n;
            p:=0;
            while k<>0 do
                  begin
                  p:=k mod i;
                  if p>=10 then t:=jz[p]+t else t:=char(p+48)+t;
                  k:=k div i;
                  end;
            end;
    if (hw(t)=true)and(pf(t)=true) then inc(j);
    if (j>1) then begin pd:=false;exit; end;
    end;
if j=0 then pd:=false;
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(b,e,bj,ej);
for i:=1 to trunc(sqrt(e)) do
    if pd(i,bj,ej)=true then inc(sum);
writeln(sum);
close(input);
close(output);
end.