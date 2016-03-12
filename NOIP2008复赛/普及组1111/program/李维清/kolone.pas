var n,m,i,j,ti,t:longint;
    s:char;
    b:array[0..10000]of longint;
    a:array[0..10000]of char;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
readln(n,m);
for i:=n downto 1 do
    begin
      read(a[i]);
      b[i]:=1;
    end;
readln;
for i:=n+1 to n+m do
    begin
      read(a[i]);
      b[i]:=2;
    end;
readln;
readln(ti);
for i:=1 to ti do
    begin
    j:=2;
    while j<=n+m do
        begin
          if b[j]<>b[j-1] then begin t:=b[j];b[j]:=b[j-1];b[j-1]:=t;
                                     s:=a[j];a[j]:=a[j-1];a[j-1]:=s;
                                     j:=j+2;continue;
                               end;
          j:=j+1;
        end;
    end;
for i:=1 to n+m do
    write(a[i]);
writeln;
close(input);
close(output);
end.