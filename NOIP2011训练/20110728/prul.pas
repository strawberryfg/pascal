var w,i,b,j,k,fmax,sum,total:longint;
    a,p:array[0..52,0..22]of longint;
    f:array[0..52,0..1020]of longint;
    sumf:array[0..52]of longint;
    res,final:array[0..10020]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=res[(l+r) div 2];
         repeat
           while res[i]<x do
            inc(i);
           while x<res[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=res[i];
                res[i]:=res[j];
                res[j]:=y;
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
assign(input,'prul.in');
reset(input);
assign(output,'prul.out');
rewrite(output);
readln(w);
sumf[0]:=0;
for i:=0 to 50 do
    begin
    for j:=0 to 1000 do
        f[i,j]:=-maxlongint;
    end;
f[0,0]:=0;
for i:=1 to w do
    begin
    read(b); a[i,0]:=b;
    p[i,0]:=0;
    for j:=1 to b do
        begin
        read(a[i,j]);
        p[i,j]:=p[i,j-1]+10-a[i,j];
        end;
    sumf[i]:=sumf[i-1]+b;
    end;
fmax:=0;
for i:=1 to w do
    begin
    for j:=0 to sumf[i] do
        begin
        for k:=0 to a[i,0] do
            begin
            if (j-k>=0)and(j-k<=sumf[i-1])and(f[i-1,j-k]+p[i,k]>f[i,j]) then
               begin
               f[i,j]:=f[i-1,j-k]+p[i,k];
               if f[i,j]>fmax then
                  begin
                  fmax:=f[i,j];
                  fillchar(res,sizeof(res),0);
                  sum:=1;
                  res[1]:=j;
                  end
               else  if f[i,j]=fmax then
                        begin
                        inc(sum);
                        res[sum]:=j;
                        end;
               end;
            end;
        end;
    end;
writeln(fmax);
sort(1,sum);
i:=1;
total:=0;
while i<=sum do
 begin
 j:=i;
 inc(total); final[total]:=res[i];
 while (j+1<=sum)and(res[j]=res[j+1]) do inc(j);
 i:=j+1;
 end;
if total>10 then total:=10;
for i:=1 to total-1 do write(final[i],' ');
write(final[total]);
writeln;
close(input);
close(output);
end.
