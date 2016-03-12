const
     max =200000;

  type
     tlist = array[0..max] of longint;

  var
     a,b: tlist;
     m,n,i,j,k,l,t:longint;
procedure c(i,j:longint);
var t:longint;
begin
t:=b[i];
b[i]:=b[j];
b[j]:=t;
end;
function pd:boolean;
var i:longint;
begin
pd:=true;
for i:=k-1 downto 1 do
    if b[l]*a[j]=b[i] then pd:=false;
end;
begin
assign(input,'panda.in');
assign(output,'panda.out');
reset(input);
rewrite(output);
readln(n,m);
for i:=1 to n do
    read(a[i]);
t:=maxlongint;
a[0]:=1;
b[0]:=1;
k:=1;
l:=0;
for i:=0 to 31 do
    begin
    for j:=1 to n do
        if (b[l]*a[j]<2000000000)and(pd) then begin b[k]:=b[l]*a[j];inc(k);end;
    inc(l);
    end;
for i:=1 to m do
    for j:=i to k-2 do
        begin
        if b[i]>b[j] then c(i,j);
        end;
writeln(b[m]);
close(input);
close(output);
end.
