var i,j,n,x,y,dep,k:longint;
    a:array[0..21,0..21]of longint;
begin
assign(input,'rotate.in');reset(input);
assign(output,'rotate.out');rewrite(output);
readln(n);
a[1,1]:=1;
x:=1;
y:=1;
dep:=2;
while k<=(n+1)div 2 do
        begin
        while (a[x,y+1]=0)and(y<n) do
                begin
                inc(y);
                a[x,y]:=dep;
                inc(dep);
                end;
        while (a[x+1,y]=0)and(x<n) do
                begin
                inc(x);
                a[x,y]:=dep;
                inc(dep);
                end;
        while (a[x,y-1]=0)and(y>1) do
                begin
                dec(y);
                a[x,y]:=dep;
                inc(dep);
                end;
        while (a[x-1,y]=0)and(x>1) do
                begin
                dec(x);
                a[x,y]:=dep;
                inc(dep);
                end;
        inc(k);
        end;
for i:=1 to n do
        begin
        for j:=1 to n do
            write(a[i,j]:4);
        writeln;
        end;
close(input);
close(output);
end.