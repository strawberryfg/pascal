const maxn=10000;
var n,k,i:integer;
    a:array[1..maxn]of integer;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]>x do{升序－－> 降序<，下同）
            inc(i);
           while x>a[j] do
            dec(j);
           if not(i>j) then{i>j不变}
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;{不变}
         if l<j then{不变}
           sort(l,j);
         if i<r then{不变}
           sort(i,r);
      end;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
    readln(a[i]);
sort(1,n);
writeln(a[k]);
close(input);
close(output);
end.