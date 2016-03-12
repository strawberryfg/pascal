var s:string;
    a,i,j:longint;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(s);
a:=length(s);
if s[1]=' ' then delete(s,1,1)
            else if s[a]=' ' then delete(s,a,1);
for i:=1 to a-1 do
    for j:=i+1 to a do
        begin
        case s[i] of
        'A','E','I','O','U':delete(s,i,1);
        end;
    if (s[i]=s[j]) and (s[i]<>' ')then delete(s,j,1);
        end;
        a:=length(s);
for i:=1 to length(s) do
    while (s[i]=' ') and (s[i+1]=' ') do delete(s,i,1);
for i:=1 to length(s) do
    if s[i]=s[i+1] then  delete(s,i+1,1);
writeln(s);
close(input);
close(output);
end.
