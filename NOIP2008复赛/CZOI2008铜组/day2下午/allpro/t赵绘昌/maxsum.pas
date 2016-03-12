var a:array[1..1000] of longint;
    i,j,n,k,t,f:longint;
    m:boolean;
begin
assign(input,'maxsum.in');
reset(input);
assign(output,'maxsum.out');
rewrite(output);
t:=maxlongint;
f:=0;
while not eof do
    begin
    inc(f);
    readln(a[f]);
    if a[f]<t then t:=a[f];
    end;
for i:=t downto 1 do
    begin
    m:=true;
    for j:=1 to f do
        if a[j] mod i<>0 then begin m:=false;break;end;
    if m=true then begin writeln(i);close(input);close(output);halt; end;
    end;
close(input);
close(output);
end.
