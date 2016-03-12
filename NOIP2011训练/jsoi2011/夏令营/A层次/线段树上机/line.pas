const maxn=20200;
type rec=record
          le,ri:longint;
          end;
var n,i,leng,tmp,last:longint;
    a:array[1..maxn]of rec;
procedure sort(l,r: longint);
      var
         i,j,x: longint;
         y:rec;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2].le;
         repeat
           while a[i].le<x do
            inc(i);
           while x<a[j].le do
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
{assign(input,'line.in');
reset(input);}
readln(n);
for i:=1 to n do
    begin
    readln(a[i].le,a[i].ri);
    end;
sort(1,n);
last:=a[1].ri;
tmp:=a[1].le;

for i:=2 to n do
    begin
    if a[i].le>last then
       begin
       leng:=leng+last-tmp;
       last:=a[i].ri;
       tmp:=a[i].le;
       end
    else
       if a[i].ri>last then
         last:=a[i].ri;
    end;
leng:=leng+last-tmp;
writeln(leng);
//close(input);
end.