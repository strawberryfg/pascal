var i,n,m,j,t:longint;
    k:char;
    a:array[1..100000]of char;
    b:array[1..100000]of longint;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    read(a[n+1-i]);
    b[n+1-i]:=1;
    end;
readln;
for i:=1 to m do
    begin
    read(a[i+n]);
    b[i+n]:=2;
    end;
readln(t);
for i:=1 to t do
    for j:=1 to n+m-1 do
        if (b[j]=1)and(b[j+1]=2) then begin
                                      b[j+1]:=1;
                                      b[j]:=2;
                                      k:=a[j];
                                      a[j]:=a[j+1];
                                      a[j+1]:=k;
                                      inc(j);
                                      end;
for i:=1 to n+m do
    write(a[i]);
writeln;
close(input);
close(output);
end.