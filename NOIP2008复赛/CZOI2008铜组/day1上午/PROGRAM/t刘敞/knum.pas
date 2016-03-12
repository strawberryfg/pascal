program knum;
const max=10000;
type arr=array[1..max]of longint;
procedure qsort(var a : arr;n:longint);

    procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]>x do
            inc(i);
           while x>a[j] do
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
       sort(1,n);
    end;
var a:arr;
    i,n,k:longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
read(n,k);
for i:=1 to n do
        readln(a[i]);
qsort(a,n);
writeln(a[k]);
close(input);
close(output);
end.
