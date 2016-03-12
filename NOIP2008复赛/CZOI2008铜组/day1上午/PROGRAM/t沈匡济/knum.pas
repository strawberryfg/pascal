program knum;
var x,s,i,n,k,j:longint;
    a:array[-32768..32767]of integer;
begin
assign(input,'knum.in');reset(input);
assign(output,'knum.out');rewrite(output);
readln(n,k);
for i:=1 to n do
    begin
    readln(s);
    if s>x then x:=s;
    inc(a[s]);
    end;
s:=0;
for i:=x downto 1 do
        begin
        if a[i]<>0 then inc(s);
        if s=k then break;
        end;
writeln(i);
close(input);
close(output);
end.