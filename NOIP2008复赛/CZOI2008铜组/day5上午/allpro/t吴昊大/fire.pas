var x:char;
    n,i,j,count:longint;
    a:array[1..10,1..10] of longint;
procedure pd;
var i,j,x:longint;
begin
for i:=1 to n do
    for j:=1 to n do
        if a[i,j]=0 then
                    begin
                    inc(count);
                    a[i,j]:=2;
                    for x:=j-1 downto 1 do
                        if a[i,x]=-1 then break
                                     else if a[i,x]=0 then a[i,x]:=1;
                    for x:=j+1 to n do
                        if a[i,x]=-1 then break
                                     else if a[i,x]=0 then a[i,x]:=1;
                    for x:=i-1 downto 1 do
                        if a[x,j]=-1 then break
                                     else if a[x,j]=0 then a[x,j]:=1;
                    for x:=i+1 to n do
                        if a[x,j]=-1 then break
                                     else if a[x,j]=0 then a[x,j]:=1;
                    exit;
                    end;
writeln(count);
close(input);
close(output);
halt;
end;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(x);
        if x='X' then a[i,j]:=-1;
        end;
    readln;
    end;
repeat
pd;
until 1=2;
end.
