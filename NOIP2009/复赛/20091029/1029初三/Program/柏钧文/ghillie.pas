var nn,n,t,i,j,k,q,sum,sum1:longint;
        a,b,c:array[1..500]of longint;
        s:string;
begin
assign(input,'ghillie.in');
reset(input);
assign(output,'ghillie.out');
rewrite(output);
readln(n);
t:=0;
while not eoln do
        begin
        inc(t);
        read(a[t]);
        inc(b[a[t]]);
        end;
for i:=1 to n do
   for j:=1 to t do
        begin
        sum:=0;
        str(a[j],s);
        for q:=1 to length(s) do
          begin
          sum1:=1;
          for k:=1 to i+1 do
              sum1:=sum1*(ord(s[q])-48);
          sum:=sum+sum1;
          end;
        b[sum]:=0;
        end;
nn:=0;
for i:=1 to 255 do
    if b[i]<>0 then
        begin
        inc(nn);
        c[nn]:=i;
        end;
for i:=1 to nn-1 do
    write(c[i],' ');
writeln(c[nn]);
close(input);
close(output);
end.
