var s,t:string;
        i,j:longint;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(s);
for i:=1 to length(s) do
        if (s[i]='A')or(s[i]='E')or(s[i]='I')or(s[i]='O')or(s[i]='U') then s[i]:=char(100);
i:=1;
while s[i]=' ' do
        begin
        s[i]:=char(100);
        inc(i);
        end;
j:=length(s);
while s[j]=' ' do
        begin
        s[j]:=char(100);
        dec(j);
        end;
for i:=1 to length(s)-1 do
        if s[i]<>' ' then
        for j:=i+1 to length(s) do
                if s[i]=s[j] then s[j]:=char(100);

for i:=1 to length(s) do
         if s[i]<>char(100) then t:=t+s[i];
for i:=1 to length(t) do
        if not((t[i]=' ')and(t[i-1]=' ')) then write(t[i]);
writeln;
close(input);
close(output);
end.
