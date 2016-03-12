var a:array[1..1000]of char;
    b:array[1..1000]of longint;
    k,t,i,j,n1,n2,temp:longint;
    tempc:char;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
readln(n1,n2);
for i:=n1 downto 1 do
    begin
    read(a[i]);
    b[i]:=1;
    end;
readln;
for i:=n1+1 to n1+n2 do
    begin
    read(a[i]);
    b[i]:=2;
    end;
readln;
readln(t);
k:=n1+n2;
for i:=1 to t do
    begin
    j:=1;
    while j<k do
          begin
          if b[j]<b[j+1] then
             begin
             tempc:=a[j];
             a[j]:=a[j+1];
             a[j+1]:=tempc;
             temp:=b[j];
             b[j]:=b[j+1];
             b[j+1]:=temp;
             inc(j,2);
             end
             else inc(j);
          end;
    end;
for i:=1 to k do
    write(a[i]);
writeln;
close(input);
close(output);
end.