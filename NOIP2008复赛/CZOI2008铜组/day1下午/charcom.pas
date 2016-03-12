var i,j,l,n,sum:longint;
    s:string;
    f:array[1..26]of longint;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(s);
f[n]:=1;
for i:=n-1 downto 1 do
    f[i]:=f[i+1]*2;
l:=1;
for i:=1 to length(s) do
    begin
    for j:=l to ord(s[i])-65 do{ord(s[i])-64-1，即到该字母前一个字母（前驱）}
        sum:=sum+f[j];
    inc(sum);
    l:=ord(s[i])-63;{-64+1，后驱}
    end;
writeln(sum);
close(input);
close(output);
end.
