var n,k,k1,i,j:longint;
    a,t,f:array[1..200]of longint;
    p:array[0..9,1..9]of longint;
function power(a,b:longint):longint;
        var s:longint;
        begin
         s:=0;
         while a>0 do
                begin
                 s:=s+p[a mod 10,b];
                 a:=a div 10;
                end;
         power:=s;
        end;
procedure work(x:longint);
        var i,j,s:longint;
        begin
         for i:=1 to k do
                 if a[i]<>-1 then t[i]:=power(a[i],x);
         for i:=1 to k do
                for j:=1 to k do
                        if a[i]=t[j] then a[i]:=-1;
        end;
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
 assign(input,'ghillie.in');
 reset(input);
 assign(output,'ghillie.out');
 rewrite(output);
 readln(n);
 for i:=1 to 9 do
        begin
         k:=i;
         for j:=2 to n+1 do
                begin
                 k:=k*i;
                 p[i,j]:=k;
                end;
        end;
 k:=0;
 while not eoln do
        begin
         inc(k);
         read(a[k]);
        end;
 for i:=1 to n do
        begin
         work(i+1);
        end;
 sort(1,k);
 k1:=1;
 while a[k1]=-1 do inc(k1);
 for i:=k1 to k-1 do write(a[i],' ');
 writeln(a[k]);
 close(input);
 close(output);
end.