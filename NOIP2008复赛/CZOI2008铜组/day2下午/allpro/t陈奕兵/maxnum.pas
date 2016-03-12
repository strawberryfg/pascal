type tlist=array[1..1000]of integer;
var total,x,i,j,k:longint;
    n:tlist;
procedure asd;
begin
close(input);
close(output);
end;
procedure qsort(var a : tlist);
    procedure sort(l,r: longint);
      var i,j,x,y: longint;
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
       sort(1,i);
    end;
begin
assign(input,'maxnum.in');
assign(output,'maxnum.out');
reset(input);
rewrite(output);
i:=0;
while not eoln do
      begin
      readln(n[i+1]);
      inc(i);
      end;
qsort(n);
k:=0;
total:=1;
for x:=1 to n[1] do
    begin
    for j:=1 to i do
        if n[j] mod x=0 then inc(k);
    if k=i then total:=k;
    k:=0;
    end;
writeln(total);
asd;
end.
