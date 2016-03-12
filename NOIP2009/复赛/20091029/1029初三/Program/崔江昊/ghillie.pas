var n,x,j,i,t,d,e,r,p:longint;
   a,b:array[1..255] of longint;
begin
assign(input,'ghillie.in');
reset(input);
assign(output,'ghillie.out');
rewrite(output);
readln(n);
j:=0;
while not eoln do
 begin j:=j+1;read(x);b[x]:=1;a[j]:=x;end;
for p:=1 to n do
   begin
   for i:=1 to j do
      if b[a[i]]<>-1 then  begin
                        x:=0;
                        d:=a[i];
                        while d<>0 do
                           begin
                           t:=d mod 10;
                           e:=1;
                           r:=p+1;
                           while r<>0 do
                              begin
                              e:=e*t;
                              r:=r-1;
                              end;
                           d:=d div 10;
                           x:=x+e;
                           end;
                           if (x<=255) and(b[x]=1) then b[x]:=-1;
                        end;
   end;
   for i:=1 to 255 do
   if b[i]=1 then begin write(i); break end;
   for j:=i+1 to 255 do
   if b[j]=1 then write(' ',j);
writeln;
close(input);
close(output);
end.
