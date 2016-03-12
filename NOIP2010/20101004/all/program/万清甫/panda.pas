var i,n,k,max,sum,j,res,t,tot:longint;
    a,num:array[1..1000000]of longint;
    f:array[1..100,0..10]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=num[(l+r) div 2];
         repeat
           while num[i]<x do
            inc(i);
           while x<num[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=num[i];
                num[i]:=num[j];
                num[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
  procedure sort2(l,r: longint);
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
           sort2(l,j);
         if i<r then
           sort2(i,r);
      end;
begin
assign(input,'panda.in');
reset(input);
assign(output,'panda.out');
rewrite(output);
readln(n,k);
for i:=1 to n do read(num[i]);
sort(1,n);
max:=2;
for i:=1 to n do
    begin
    f[i,0]:=1;
    for j:=1 to max do f[i,j]:=num[i]*f[i,j-1];
    end;
for i:=1 to k*10 do
    begin
    res:=1;
    for j:=1 to n do
        begin
        tot:=0;
        t:=random(2);
        while int64(res)*int64(f[j,t])>int64(maxlongint) do
        begin
        if tot>5 then break;
        inc(tot);
        t:=random(2);
        end;
        if int64(res)*int64(f[j,t])<=int64(maxlongint) then
           res:=res*f[j,t];
        end;
    inc(sum);
    a[sum]:=res;
    end;
sort2(1,sum);
writeln(a[k]);
close(input);
close(output);
end.