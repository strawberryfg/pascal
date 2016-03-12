type arr=array[1..100]of longint;
var n:arr;
    i,j,b:longint;
procedure qsort(var a :arr );

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
       sort(1,j);
    end;
begin
assign(input,'knum.in');
assign(output,'knum.out');
reset(input);
rewrite(output);
readln(j,b);
for i:=1 to j do
    readln(n[i]);
qsort(n);
writeln(n[j-b+1]);
close(input);
close(output);
end.
