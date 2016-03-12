{
ID: xiaweiy1
PROG: barn1
LANG: PASCAL
}
var m,s,c,i,j,k,t,min:longint;
    a:array[1..200]of longint;
    f:array[1..200,1..200]of longint;


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
assign(input,'barn1.in');
reset(input);
assign(output,'barn1.out');
rewrite(output);
readln(m,s,c);
for i:=1 to c do
    readln(a[i]);
sort(1,c);
for i:=1 to c do
    begin
    f[i,1]:=a[i]-a[1]+1;
    f[i,i]:=i;
    end;
for i:=1 to c do
    begin
    for j:=2 to m do
        begin
        min:=maxlongint;
        if j>=i then break
           else begin
                for k:=i-1 downto j-1 do
                    begin
                    t:=a[i]-a[k+1]+1;
                    if t+f[k,j-1]<min then min:=t+f[k,j-1];
                    end;
                end;
        if min<>maxlongint then f[i,j]:=min;
        end;
    end;
min:=maxlongint;
for i:=1 to m do
    if (f[c,i]<min)and(f[c,i]<>0) then min:=f[c,i];
writeln(min);
close(input);
close(output);
end.
