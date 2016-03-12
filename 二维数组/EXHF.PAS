var a:array[1..23,1..23]of longint;
    i,j,k,n,ti,tj:longint;
begin
read(n);
i:=1;
j:=n div 2+1;
for k:=1 to n*n do
    begin
    a[i,j]:=k;
    ti:=i-1;
    tj:=j-1;
    if ti=0 then ti:=n;
    if tj=0 then tj:=n;
    if a[ti,tj]=0 then begin i:=ti; j:=tj; end
                  else i:=i+1;
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
    writeln;
    end;
end.