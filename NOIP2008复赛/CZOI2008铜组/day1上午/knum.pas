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
           while a[i]>x do{���򣭣�> ����<����ͬ��
            inc(i);
           while x>a[j] do
            dec(j);
           if not(i>j) then{i>j����}
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;{����}
         if l<j then{����}
           sort(l,j);
         if i<r then{����}
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