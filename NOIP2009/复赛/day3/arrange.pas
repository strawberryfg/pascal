var n,q,i,t:longint;
    a:array[0..1000]of longint;
    f:array[0..1000,0..1000]of longint;

    procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function find(left,right:longint):longint;
var t,min,i:longint;
begin
if f[left,right]<>0 then exit(f[left,right]);
if right-left=1 then begin f[left,right]:=0; exit(0); end;
min:=maxlongint;
t:=0;
for i:=left+1 to right-1 do
    begin
    t:=find(left,i)+find(i,right)+a[right]-a[left]-2;
    if t<min then min:=t;
    end;
f[left,right]:=min;
exit(min);
end;
begin
assign(input,'arrange.in');
reset(input);
assign(output,'arrange.out');
rewrite(output);
readln(n,q);
for i:=1 to q do begin read(t);a[i]:=t; end;
a[0]:=0; a[q+1]:=n+1;
sort(1,q);
writeln(find(0,q+1));
close(input);
close(output);
end.