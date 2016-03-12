var num,max,i,n,k:longint;
    a,b,pos:array[1..52000]of longint;
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
                y:=b[i];
                b[i]:=b[j];
                b[j]:=y;
                y:=pos[i];
                pos[i]:=pos[j];
                pos[j]:=y;
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
readln(n,k);
for i:=1 to n do
    begin
    readln(a[i],b[i]);
    pos[i]:=i;
    end;
sort(1,n);
max:=0;
for i:=1 to k do
    begin
    if b[i]>max then
       begin
       num:=pos[i];
       max:=b[i];
       end;
    end;
writeln(num);
end.