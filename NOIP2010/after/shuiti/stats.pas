var a:array[1..1000]of longint;
    i,n,sum:longint;
    t:extended;
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
readln(n);
for i:=1 to n do readln(a[i]);
for i:=1 to n do
    begin
    sum:=sum+a[i];
    end;
t:=sum/n;
writeln(t:0:2);
sort(1,n);
if n mod 2=1 then
   begin
   t:=a[(n+1) div 2];
   writeln(t:0:2);
   end
else begin
     sum:=a[n div 2]+a[n div 2+1];
     t:=sum/2;
     writeln(t:0:2);
     end;
end.