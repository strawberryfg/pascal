var i,n,l,r,k,s:longint;
    a:array[1..1000]of longint;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
k:=0;
l:=0;
r:=0;
s:=0;
for i:=1 to n do
    read(a[i]);
for i:=1 to n do
    begin
    for k:=1 to n do
        begin
        if (a[i]<a[k])and(k<i) then l:=l+1;
        if (a[i]<a[k])and(k>i) then r:=r+1;
        end;
        if l=r then s:=s+1;
        l:=0;
        r:=0;
    end;
writeln(s);
close(input);
close(output);
end.