const maxn=10;
var a:array[1..maxn] of longint;
    i,j,k,x,n:longint;
begin
for i:=1 to maxn do
    begin
    read(n);
    a[i]:=n;
    if i>1 then
           begin
           for j:=i downto 2 do
               begin
               x:=a[j];
               k:=j-1;
               while (k>0)and(x>a[k]) do
                     begin
                     a[k+1]:=a[k];
                     k:=k-1;
                     a[k+1]:=n;
                     end;
               end;
           end;
    end;
for i:=1 to maxn do write(a[i]:4);
writeln;
end.