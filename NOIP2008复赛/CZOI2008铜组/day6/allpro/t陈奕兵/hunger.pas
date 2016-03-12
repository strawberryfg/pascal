type
     tlist = array[1..1000,1..2] of longint;
var c,total,i,j,k,x:longint;
    n:array[1..1000,1..2]of longint;
    s:array[1..1000]of longint;
procedure qsort(var a:tlist );

    procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2,1];
         repeat
           while a[i,1]<x do
            inc(i);
           while x<a[j,1] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i,2];
                a[i,2]:=a[j,2];
                a[j,2]:=y;
                y:=a[i,1];
                a[i,1]:=a[j,1];
                a[j,1]:=y;
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
       sort(1,c);
    end;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(c);
 for i:=1 to c do
    for j:=1 to 2 do
        read(n[i,j]);
qsort(n);total:=0;x:=0;
for i:=1 to c do
    s[i]:=n[i,2]-n[i,1]+1;
for i:=c downto 1 do
    begin
    x:=0;
    for j:=i-1 downto 1 do
      if (n[i,1]>n[j,2]) then
      total:=total+s[j];
    end;
writeln(total);
close(input);
close(output);
end.