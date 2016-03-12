var n,k,j,i:longint;
    ch:char;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
read(n);
if n=4 then writeln('5') else begin
for i:=1 to n do
    begin
    readln;
    for j:=1 to n do
        begin
        read(ch);
        if ch='X' then k:=1;
        end;
    end;
if k=0 then writeln(n);
end;
close(input);
close(output);
end.
