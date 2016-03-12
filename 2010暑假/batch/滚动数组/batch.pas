var n,i,min,j,k,tmp,s:longint;
    t,f,st,sf,th,h:array[0..10000]of longint;
begin
assign(input,'batch.in');
reset(input);
assign(output,'batch.out');
rewrite(output);
readln(n);
readln(s);
for i:=1 to n do
    begin
    read(t[i],f[i]);
    st[i]:=st[i-1]+t[i];
    sf[i]:=sf[i-1]+f[i];
    end;
min:=maxlongint;
for i:=1 to n do h[i]:=(st[i]+s)*sf[i];
for j:=2 to n do
    begin
    th:=h;
    for i:=j to n do h[i]:=maxlongint;
    for i:=j to n do
        begin
        for k:=j-1 to i-1 do
            begin
            tmp:=th[k]+(j*s+st[i])*(sf[i]-sf[k]);
            if h[i]=0 then h[i]:=tmp
               else if tmp<h[i] then h[i]:=tmp;
            if (i=n)and(h[i]<min) then min:=h[i];
            end;
        end;
    //h:=th;
    end;
writeln(min);
close(input);
close(output);
end.
