var ans,s,i,j,n,m,max:longint;
    a:array[1..100] of longint;
    b:array[1..100,1..100] of longint;
begin
assign(input,'tree.in');
assign(output,'tree.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(a[i]);
    while not eoln do
          begin
          read(m);
          b[i,m]:=1;
          end;
    end;max:=0;
for i:=n downto 1 do
    begin
    ans:=0;
    for j:= i to n do
        if (b[i,j]=1)  and (a[j] > ans) then ans:=a[j];
    a[i]:=ans+a[i];
    if a[i]>max then max:=a[i];
    end;
writeln(max);
close(input);
close(output);
end.