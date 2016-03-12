type arr=array[1..10000]of longint;
var aa:arr;
    a:array[1..10000]of extended;
    f:array[0..10000]of extended;
    n,i,j,k,c:longint;
    temp:extended;

procedure qsort(var a : arr);
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
       sort(1,n);
    end;

begin
assign(input,'divide.in');
assign(output,'divide.out');
reset(input);
rewrite(output);
read(n,k,c);
for i:=1 to n do
    read(aa[i]);
qsort(aa);
for i:=1 to n do
    a[i]:=aa[i];
f[0]:=0;
for i:=1 to n do
    begin
    f[i]:=-1;
    for j:=1 to i-k+1 do
        if f[j-1]<>-1 then
           if f[i]=-1 then f[i]:=f[j-1]+c+(a[i]-a[j])*(a[i]-a[j])
              else
              begin
              temp:=f[j-1]+c+(a[i]-a[j])*(a[i]-a[j]);
              if temp<f[i] then f[i]:=temp;
              end;
    //if f[i-1]<-1 then
      // f[i]:=f[i];
    end;
writeln(trunc(f[n]));
close(input);
close(output);
end.
