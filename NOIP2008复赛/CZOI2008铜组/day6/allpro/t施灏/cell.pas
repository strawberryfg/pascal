var b:string;
    n,m,i,j,s,k:longint;
    c:array[1..60] of string;
    a:array[0..60,0..60] of longint;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(m,n);
if m=1 then begin writeln(0);close(input);close(output);halt;end;
s:=0;
for i:=1 to m do
    begin
    a[i,0]:=-1;
    a[i,n+1]:=-1;
    end;
for i:=1 to n do
    begin
    a[0,i]:=-1;
    a[m+1,i]:=-1;
    end;
for i:=1 to m do
    begin
    read(c[i]);
    readln;
    b:=b+c[i];
    end;
k:=1;
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        a[i,j]:=ord(b[k])-48;
        k:=k+1;
        end;
    end;
for i:=1 to m do
    begin
    for j:=1 to n do
        if a[i,j]<>0 then
                     if (a[i-1,j]<>0)
                     and(a[i+1,j]<>0)
                     and(a[i,j-1]<>0)
                     and(a[i,j+1]<>0)
                     then
                     inc(s);
    end;
if (a[m,n]<>0)and(a[m-1,n]<>0)  and(a[m,n-1]<>0) then s:=s-1;
if (a[1,1]<>0)and(a[2,1]<>0)    and(a[1,2]<>0)   then s:=s-1;
if (a[m,1]<>0)and(a[m-1,1]<>0)  and(a[m,2]<>0)   then s:=s-1;
if (a[1,n]<>0)and(a[2,n]<>0)    and(a[1,n-1]<>0) then s:=s-1;
writeln(s);
close(input);
close(output);
end.