var i,n,time,j,tmp,max:longint;
    f,tf:array[0..10000]of longint;
    c,t:array[1..3001]of longint;
begin
assign(input,'lily.in');
reset(input);
assign(output,'lily.out');
rewrite(output);
readln(n,time);
for i:=1 to n do readln(t[i],c[i]);
for i:=1 to n-1 do
    for j:=i+1 to n do
        begin
        if t[i]*c[j]>t[j]*c[i] then
           begin
           tmp:=t[i]; t[i]:=t[j]; t[j]:=tmp;
           tmp:=c[i]; c[i]:=c[j]; c[j]:=tmp;
           end;
        end;
for i:=1 to n do
    begin
    f:=tf;
    for j:=0 to time do
        begin
        if (t[i]+j<=time)and(tf[t[i]+j]+c[i]*(t[i]+j)>f[j]) then
           begin
           f[j]:=tf[t[i]+j]+c[i]*(t[i]+j);
           if f[j]>max then max:=f[j];
           end;
        end;
    tf:=f;
    end;
writeln(max);
close(input);
close(output);
end.