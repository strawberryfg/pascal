var i,j,k,t,num,total,sum,n,tt:longint;
    a,b,c,d,hash:array[0..255]of longint;
    f:array[0..9,1..9]of longint;
    s:string;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=d[(l+r) div 2];
         repeat
           while d[i]<x do
            inc(i);
           while x<d[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=d[i];
                d[i]:=d[j];
                d[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function check(number:longint):longint;
var i:longint;
begin
check:=0;
i:=0;
for i:=1 to total do if a[i]=number then exit(i);
end;
begin
assign(input,'ghillie.in');
reset(input);
assign(output,'ghillie.out');
rewrite(output);
readln(n);
while not eoln do
      begin
      inc(total);
      read(a[total]);
      hash[a[total]]:=total;
      end;
c:=a;
for i:=1 to 9 do
    begin
    f[i,1]:=i;
    for j:=2 to n+1 do
        begin
        t:=i;
        for k:=2 to j do t:=t*i;
        f[i,j]:=t;
        end;
    end;
for i:=1 to n do
    begin
    for j:=1 to total do
        begin
        if a[j]=-1 then continue;
        str(a[j],s);
        sum:=0;
        for k:=1 to length(s) do
            begin
            inc(sum,f[ord(s[k])-48,i+1]);
            end;
        b[j]:=sum;
        end;
    for j:=1 to total do
        begin
        if a[j]=-1 then continue;
        tt:=check(b[j]);
        a[j]:=b[j];
        if tt<>0 then
           begin
           a[tt]:=-1;
           end;
        end;
    end;
for i:=1 to total do
    begin
    if a[i]<>-1 then begin inc(num);d[num]:=c[i]; end;
    end;
sort(1,num);
for i:=1 to num-1 do write(d[i],' '); write(d[num]);
writeln;
close(input);
close(output);
end.