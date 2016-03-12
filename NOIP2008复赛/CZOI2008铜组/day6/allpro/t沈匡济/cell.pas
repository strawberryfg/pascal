var j,m,n,i,s:longint;
    a,b:array[-60..3600]of integer;
    c:char;
function zhao(i:longint):longint;
        var t:longint;
        begin
        t:=0;
        if (i mod n<>1)and(a[i-1]<>0) then inc(t);
        if (i mod n<>0)and(a[i+1]<>0)then inc(t);
        if a[i-n]<>0 then inc(t);
        zhao:=t;
        end;
begin
assign(input,'cell.in');reset(input);
assign(output,'cell.out');rewrite(output);
readln(m,n);
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        read(c);
        a[(i-1)*n+j]:=ord(c)-48;
        end;
    readln;
    end;
s:=0;
for i:=1 to m*n do
        if (a[i]>0)then
        begin
        if (a[i]<=4) then b[i]:=zhao(i);
        if (i>n)and(a[i-n]>0)and(a[i-n]<5) then inc(b[i-n]);
        end;
for i:=1 to m*n do
        if (a[i]=b[i])and(a[i]<>0) then inc(s);
writeln(s);
close(input);
close(output);
end.
