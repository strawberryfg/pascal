program knum;
var n,k,i:longint;
      a:array[1..10000]of longint;
procedure qsort;

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
       sort(1,n);
    end;
begin
     assign(input,'knum.in');reset(input);
     assign(output,'knum.out');rewrite(output);
     read(n,k);
     for i:=1 to n do
            begin
                 readln(a[i]);
            end;
     qsort;
     writeln(a[n-k+1]);
close(input);
close(output);
end.
