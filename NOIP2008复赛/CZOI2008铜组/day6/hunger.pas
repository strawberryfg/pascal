var i,n,tmp,j,max:longint;
    s,e,f:array[1..1001]of longint;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do read(s[i],e[i]);
for i:=1 to n-1 do
    for j:=i+1 to n do
        if s[i]>s[j] then begin tmp:=s[i];s[i]:=s[j];s[j]:=tmp;
                                tmp:=e[i];e[i]:=e[j];e[j]:=tmp;
                          end;
for i:=1 to n do
    begin
    f[i]:=e[i]-s[i]+1;
    for j:=1 to i-1 do
        if (s[i]>e[j])and(f[j]+e[i]-s[i]+1>f[i]) then f[i]:=f[j]+e[i]-s[i]+1;
    end;
max:=0;
for i:=2 to n do if f[i]>max then max:=f[i];
writeln(max);
close(input);
close(output);
end.
