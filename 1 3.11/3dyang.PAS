var i,j,n:longint;
begin
read(n);
j:=1;
for i:=1 to n do
begin
 repeat
 begin
 if j<=n-i then write(' ') else write('* ');
 j:=j+1;
 end;
 until j>n;
 j:=1;
 writeln;
end;
end.