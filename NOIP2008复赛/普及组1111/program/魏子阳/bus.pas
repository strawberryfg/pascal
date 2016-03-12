var n,d,i,j,k,l:longint;
    a,f,s,t:array[1..2500]of longint;
    ch:char;
    ok:array[1..2500,1..2500]of boolean;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
readln(n,d);
for i:=1 to n do
    begin
    read(ch);
    if ch='H' then a[i]:=1;
    if ch='J' then a[i]:=-1;
    end;
s[1]:=a[1];
for i:=2 to n do
    s[i]:=s[i-1]+a[i];
fillchar(ok,sizeof(ok),false);
for i:=1 to n-1 do
    for j:=i+1 to n do
        begin
        if (abs(s[j]-s[i]+a[i])<=d)or(abs(s[j]-s[i])=j-i) then ok[i,j]:=true;
        end;
f[1]:=1;t[1]:=1;
for i:=2 to n do
    f[i]:=maxlongint;
for i:=2 to n do
    begin
    if ok[1,i]=true then begin f[i]:=1;t[i]:=1;end;
    for j:=i-1 downto 1 do
        begin
        if (ok[j,i]=true)and(f[j]+1<f[i]) then begin f[i]:=f[j]+1;t[i]:=j;end;
        if (ok[t[j],i]=true)and(f[j]<f[i]) then begin f[i]:=f[j];t[i]:=t[j];end;
        end;
    end;
write(f[n]);
close(input);
close(output);
end.
