var n,m,i,s,j,k,l,t:longint;
    a,b:array[1..255]of longint;
begin
assign(input,'ghillie.in');
assign(output,'ghillie.out');
reset(input);
rewrite(output);
readln(n);
m:=0;
while not eof do
      begin
      inc(m);
      read(a[m]);
      b[m]:=a[m];
      end;
m:=m-1;
s:=0;
for i:=2 to n+1 do
    begin
    for j:=1 to m do
        begin
        s:=0;
        while b[j]<>0 do
              begin
              l:=1;
              t:=b[j] mod 10;
              b[j]:=b[j] div 10;
              for k:=1 to i do
                  l:=l*t;
              s:=s+l;
              end;
        for k:=1 to m do
            if a[k]=s then a[k]:=0;
        b[j]:=s;
        end;
    end;
for i:=1 to m-1 do
    for j:=i to m do
        if a[i]>a[j] then begin k:=a[i];a[i]:=a[j];a[j]:=k;end;
for i:=1 to m-1 do
    if a[i]<>0 then write(a[i],' ');
writeln(a[m]);
close(input);
close(output);
end.
