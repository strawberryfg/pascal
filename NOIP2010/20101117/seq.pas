var i,n,t,tmp,ans:longint;
    a,sum,pos,f,rea:array[0..200000]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=sum[(l+r) div 2];
         repeat
           while sum[i]<x do
            inc(i);
           while x<sum[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=sum[i];
                sum[i]:=sum[j];
                sum[j]:=y;
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
assign(input,'seq.in');
reset(input);
assign(output,'seq.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a[i]);
    sum[i]:=sum[i-1]+a[i];
    pos[i]:=i;
    end;
f:=sum;
sort(1,n);
for i:=1 to n do
    begin
    rea[pos[i]]:=i;
    end;
ans:=0;
for i:=1 to n do
   begin
   if f[i]<>sum[i] then
      begin
      t:=pos[i];
      tmp:=f[i]; f[i]:=f[t]; f[t]:=tmp;

      pos[rea[i]]:=t; 
      pos[rea[t]]:=i;
      tmp:=rea[i]; rea[i]:=rea[t]; rea[t]:=tmp;
      inc(ans);
      end;
   end;
writeln(ans);
close(input);
close(output);
end.