var tot:longint;
    a,b:string;
function multiply(a,b:string):string;
var c,d,e:array[0..1000]of longint;
    f,p:string;
    i,j,t,k:longint;
begin
fillchar(c,sizeof(c),0);
fillchar(d,sizeof(d),0);
fillchar(e,sizeof(e),0);
f:='';
for i:=1 to length(a) do
    c[length(a)-i]:=ord(a[i])-48;
for i:=1 to length(b) do
    d[length(b)-i]:=ord(b[i])-48;
for i:=0 to length(a)-1 do
    for j:=0 to length(b)-1 do
        e[i+j]:=e[i+j]+c[i]*d[j];
t:=0;
k:=length(a)+length(b)-1;
for j:=0 to length(a)+length(b)-1 do
    begin
    if (j=length(a)+length(b)-1)and(t=0) then k:=j-1;
    e[j]:=e[j]+t;
    if e[j]>=10 then t:=e[j] div 10 else t:=0;
    e[j]:=e[j] mod 10;
    end;
for i:=0 to k do
   begin
   p:=char(e[i]+48);
   f:=p+f;
   end;
multiply:=f;
end;
begin
readln(a);
readln(b);
writeln(multiply(a,b));
end.
