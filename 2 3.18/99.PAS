var i,j:longint;
begin
for i:=1 to 9 do
begin
    for j:=1 to i do
        write(i,'*',j,'=',i*j:2,' ');
    writeln;
end;
end.