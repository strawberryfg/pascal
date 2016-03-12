var x,max,now,t,sum,total,tot,i:longint;
     a:array[1..100000000]of boolean;
     prime:array[1..1000000]of longint;
     f:array[1..1000000,1..2]of longint;
 procedure eratos;

    var
       i,j : longint;

    begin
       a[1]:=false;
       for i:=2 to max do
         a[i]:=true;
       for i:=2 to max div 2 do
         if a[i] then
           for j:=2 to max div i do
             a[i*j]:=false;
       tot:=0;
       for i:=1 to max do
        begin
          if a[i] then
           begin
             inc(tot);
             prime[tot]:=i;
           end;
        end;
       writeln;
    end;
begin
readln(x);
max:=10000000;
eratos;
now:=1;
t:=x;
while now<=tot do
   begin
   if t mod prime[now]<>0 then begin inc(now);continue; end;
   inc(total); f[total,1]:=prime[now]; f[total,2]:=0;
   sum:=0;
   while t mod prime[now]=0 do
      begin
      inc(sum);
      t:=t div prime[now];
      end;
   f[total,2]:=sum;
   inc(now);
   end;
write(x,'=',f[1,1],'^',f[1,2]);
for i:=2 to total do
    begin
    write('*',f[i,1],'^',f[i,2]);
    end;
writeln;
end.