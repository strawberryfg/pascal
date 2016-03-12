var a,sh,he:array[1..9,1..9] of longint;
    jiu:array[0..2,0..2,1..9] of longint;
    i,j,k,l:longint;
procedure print;
var i,j:longint;
begin
for i:=1 to 9 do
    begin
    for j:=1 to 8 do
        write(a[i,j],' ');
    writeln(a[i,9]);
    end;
close(input);
close(output);
halt;
end;
procedure doit(m,n:longint);
var i,j:longint;
begin
if m=10 then print
else if a[m,n]<>0 then
if n=9 then doit(m+1,1)
       else doit(m,n+1)
else for i:=1 to 9 do
     if (sh[n,i]=0)and
        (he[m,i]=0)and
        (jiu[(m-1) div 3,(n-1) div 3,i]=0)
        then
        begin
        sh[n,i]:=1;
        he[m,i]:=1;
        jiu[(m-1) div 3,(n-1) div 3,i]:=1;
        a[m,n]:=i;
        if n=9 then doit(m+1,1)
               else doit(m,n+1);
        a[m,n]:=0;
        sh[n,i]:=0;
        he[m,i]:=0;
        jiu[(m-1) div 3,(n-1) div 3,i]:=0;
        end;
end;
begin
assign(input,'puzzle.in');
assign(output,'puzzle.out');
reset(input);
rewrite(output);
for i:=1 to 9 do
    for j:=1 to 9 do
        begin
        read(a[i,j]);
        if a[i,j]<>0 then
        begin
        sh[j,a[i,j]]:=1;
        he[i,a[i,j]]:=1;
        jiu[(i-1) div 3,(j-1) div 3,a[i,j]]:=1;
        end;
        end;
doit(1,1);
end.