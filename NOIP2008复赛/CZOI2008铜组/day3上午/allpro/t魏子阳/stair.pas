var s,s1,n,i,j,k:longint;
    a,bad:array[0..100]of longint;
    pd:array[1..100]of boolean;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=bad[(l+r) div 2];
         repeat
           while bad[i]<x do
            inc(i);
           while x<bad[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=bad[i];
                bad[i]:=bad[j];
                bad[j]:=y;
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
assign(input,'stair.in');
assign(output,'stair.out');
reset(input);
rewrite(output);
readln(n);
readln(k);
for i:=1 to k do
    read(bad[i]);
for i:=1 to n do
    pd[i]:=true;
for i:=1 to k do
    pd[bad[i]]:=false;
a[0]:=1;
a[1]:=1;
a[2]:=2;
for i:=3 to n do
    begin
    a[i]:=a[i-1]+a[i-2]+a[i-3];
    end;
s:=a[n];
if k=0 then begin write(s);close(input);close(output);halt;end
else begin
sort(1,k);

for i:=1 to n-2 do
    begin
    if (pd[i]=false)and(pd[i+1]=false)and(pd[i+2]=false) then begin write('0');close(input);close(output);halt;end;
    end;
if k=1 then
for i:=1 to k do
    begin
    s:=s-a[n-bad[i]]*a[bad[i]];
    end;
if k<>1 then begin
   for i:=1 to k do
   s:=s-a[n-bad[i]]*a[bad[i]];
       for j:=1 to i-1 do
           s:=s+a[bad[i]-bad[j]]*a[bad[j]];
   end;
if s<0 then s:=1;
writeln(s);
close(input);
close(output);
end;
end.
