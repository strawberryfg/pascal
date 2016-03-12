program chorcom;
var n,j,i,l,t:longint;
        s:string;
begin
assign(input,'chorcom.in');reset(input);
assign(output,'chorcom.out');rewrite(output);
readln(n);
readln(s);
l:=2;
for i:=1 to n-1 do
    l:=l*2;
dec(l);t:=0;
for i:=1 to ord(s[1])-65 do
        begin
        l:=(l+1) div 2;
        t:=t+l;
        end;
    if ord(s[1])-65<1 then
        begin
        l:=(l+1) div 2;
        inc(t);
        end;
for j:=2 to length(s) do
    begin
    for i:=1 to ord(s[j])-ord(s[j-1])-1 do
        begin
        l:=(l+1)div 2;
        t:=t+l+1;
        end;
    if ord(s[j])-ord(s[j-1])-1<1 then
        begin
        l:=(l+1) div 2;
        inc(t);
        end;
    end;
writeln(t);
close(input);
close(output);
end.
