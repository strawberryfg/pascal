var a,b:array[1..41,1..20] of longint;
    i,j,n,t:longint;
begin
read(n);
t:=1;
for i:=1 to n do
    if i mod 2=1 then
                 for j:=1 to i do
                     begin
                     a[i,j]:=t;
                     t:=t+1;
                     end
                 else
                 for j:=i downto 1 do
                     begin
                     a[i,j]:=t;
                     t:=t+1;
                     end;
for i:=n-1 downto 1 do
    if i mod 2=1 then
                 for j:=1 to i do
                     begin
                     a[n-i+n,j]:=t;
                     t:=t+1;
                     end
                 else
                 for j:=i downto 1 do
                     begin
                     a[n-i+n,j]:=t;
                     t:=t+1;
                     end;
for i:=1 to 2*n-1 do
    if i<=n then
            if i mod 2=0 then
                         for j:=1 to i do
                             b[i+1-j,j]:=a[i,j]
                         else
                         for j:=i downto 1 do
                             b[i+1-j,j]:=a[i,j]
            else
            if i mod 2=0 then
                         for j:=i+1-n to n do
                             b[i+1-j,j]:=a[i,j-i+n]
                         else
                         for j:=n downto i+1-n do
                             b[i+1-j,j]:=a[i,j-i+n];
for i:=1 to n do
    begin
    for j:=1 to n do
        write(b[i,j]:4);
    writeln;
    end;
end.