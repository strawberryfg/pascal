var i,n,sum,j,num,tmp:longint;
    a,f:array[1..10000]of longint;
    pd:boolean;
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
readln(n);
for i:=1 to n do
    begin
    readln(f[i]);
    end;
a:=f;
sort(1,n);
for i:=1 to n do
    begin
    if a[i]=f[i] then continue;
    pd:=false;
    for j:=i+1 to n do
        begin
        if a[j]=f[j] then continue;
        if (a[i]=f[j])and(a[j]=f[i]) then
           begin
           inc(sum);
           tmp:=f[i]; f[i]:=f[j]; f[j]:=tmp;
           pd:=true;
           break;
           end;
        if (f[i]=a[j]) then num:=j;
        end;
    if not pd then begin inc(sum);tmp:=f[i];f[i]:=f[num];f[num]:=tmp; end;
    end;
writeln(sum);
end.