type tlist=array[1..1000] of longint;
var s,e:tlist;
    n,i,j,sum:longint;
procedure sort(l,r: longint);
var i,j,x,y: longint;
begin
i:=l;
j:=r;
x:=s[(l+r) div 2];
repeat
while s[i]<x do inc(i);
while x<s[j] do dec(j);
if not(i>j) then
        begin
        y:=s[i];
        s[i]:=s[j];
        s[j]:=y;
        y:=e[i];
        e[i]:=e[j];
        e[j]:=y;
        inc(i);
        j:=j-1;
        end;
until i>j;
if l<j then sort(l,j);
if i<r then sort(i,r);
end;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
read(n);
for i:=1 to n do
   read(s[i],e[i]);
sort(1,n);
i:=1;
j:=2;
repeat
if e[i]>=s[j] then
              begin
              if (e[i]-s[i]+1)>(e[j]-s[j]+1) then
                                             begin
                                             s[j]:=0;
                                             e[j]:=0;
                                             inc(j);
                                             end
                                             else
                                             begin
                                             s[i]:=0;
                                             e[i]:=0;
                                             inc(i);
                                             end;
              end;
inc(j);
until j>n;
for i:=1 to n do
    if (s[i]<>0)and(e[i]<>0) then sum:=sum+(e[i]-s[i]+1);
writeln(sum);
close(input);
close(output);
end.

