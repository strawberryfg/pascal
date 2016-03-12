var n,i:longint;
    a:array[1..200]of string;
function gaojingdu(m,n:string):string;
var s:string;
    la,lb,k,t:longint;
begin
s:='';
la:=length(m);
lb:=length(n);
k:=0;
while (la>=1)and(lb>=1) do
      begin
      t:=ord(m[la])-48+ord(n[lb])-48+k;
      if t>=10 then k:=1 else k:=0;
      t:=t-10*k;
      s:=char(t+48)+s;
      dec(la);dec(lb);
      end;
while (la>=1) do
      begin
      t:=ord(m[la])-48+k;
      if t>=10 then k:=1 else k:=0;
      t:=t-10*k;
      s:=char(t+48)+s;
      dec(la);
      end;
while (lb>=1) do
      begin
      t:=ord(n[lb])-48+k;
      if t>=10 then k:=1 else k:=0;
      t:=t-10*k;
      s:=char(t+48)+s;
      dec(lb);
      end;
if k=1 then s:='1'+s;
gaojingdu:=s;
end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
a[1]:='1';
a[2]:='1';
a[3]:='1';
for i:=4 to n do
    a[i]:=gaojingdu(a[i-1],a[i-2]);
writeln(a[n]);
close(input);
close(output);
end.