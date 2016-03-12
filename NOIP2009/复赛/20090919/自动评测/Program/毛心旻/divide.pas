var a:array[1..10001]of longint;
    n,k,c,i,kk,min,cc:longint;
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
assign(input,'divide.in');
reset(input);
assign(output,'divide.out');
rewrite(output);
read(n,k,c);
for i:=1 to n do
    read(a[i]);
sort(1,n);
kk:=1;
for i:=2 to n+1 do
    if a[i]<>a[i-1] then if i-kk>=k then begin
                                         min:=min+c+cc*cc;
                                         cc:=0;
                                         end
                                    else cc:=cc+a[i]-a[i-1];
if (a[n]-a[1])*(a[n]-a[1])+c<min then min:=c+(a[n]-a[1])*(a[n]-a[1]);
kk:=0;
for i:=1 to n div k do
    kk:=kk+c+(a[i*k]-a[i*k-k+1])*(a[i*k]-a[i*k-k+1]);
if n mod k<>0 then kk:=kk+c+(a[n]-a[(n div k)*k+1])*(a[n]-a[(n div k)*k+1]);
if kk<min then min:=kk;
writeln(min);
close(input);
close(output);
end.
