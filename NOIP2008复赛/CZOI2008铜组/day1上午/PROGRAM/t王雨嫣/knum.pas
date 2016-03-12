var n,k,i,m,s:longint;
    a:array[-32768..32767]of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'kunm.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
    begin
    readln(m);
    inc(a[m]);
    end;
s:=0;
for i:=32767 downto -32768 do
    begin
    if a[i]>0 then s:=s+a[i];
    if s>=k then begin writeln(i);break;end;
    end;
close(input);
close(output);
end.