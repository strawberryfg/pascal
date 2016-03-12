var a:array[0..10000] of longint;
    b:array[0..10000] of int64;
    i,max,j,n,k,c,p,q:longint;
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
begin
assign(input,'divide.in');
assign(output,'divide.out');
reset(input);
rewrite(output);
read(n,k,c);
for i:=1 to n do
    read(a[i]);
sort(1,n);
b[0]:=1;
for i:=0 to n-k do
    if b[i]<>0 then
    for j:=i+k to n do
    begin
    p:=c+(a[j]-a[i+1])*(a[j]-a[i+1]);
    if (b[j]=0)or(b[j]>b[i]+p)then
       b[j]:=b[i]+p;
    end;
writeln(b[n]-1);
close(input);
close(output);
end.
