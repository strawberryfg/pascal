var n,v,i,j,left,right,t1,t2:longint;
    acc,dis,value,sumv:array[0..1001]of longint;
    s:array[1..1001,1..1001]of longint;
    f:array[1..1001,1..1001,0..1]of longint;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
begin
assign(input,'power.in');
reset(input);
assign(output,'power.out');
rewrite(output);
readln(n);
readln(v);
for i:=1 to n do
    begin
    readln(acc[i],value[i]);
    sumv[i]:=sumv[i-1]+value[i];
    end;
for i:=1 to n do
    for j:=1 to n+1-i do
        begin
        left:=i; right:=j+i-1;
        s[left,right]:=sumv[left-1]+sumv[n]-sumv[right];
        end;
for i:=v-1 downto 1 do
    begin
    t1:=f[i+1][v][0]+(acc[i+1]-acc[i])*s[i+1][v];
    f[i][v][0]:=t1;
    f[i][v][1]:=f[i][v][0]+(acc[v]-acc[i])*s[i][v];
    end;
for i:=v+1 to n do
    begin
    t1:=f[v][i-1][1]+(acc[i]-acc[i-1])*s[v][i-1];
    f[v][i][1]:=t1;
    f[v][i][0]:=f[v][i][1]+(acc[i]-acc[v])*s[v][i];
    end;
for i:=v-1 downto 1 do
    begin
    for j:=v+1 to n do
        begin
        t1:=f[i+1][j][0]+(acc[i+1]-acc[i])*s[i+1][j];
        t2:=f[i+1][j][1]+(acc[j]-acc[i])*s[i+1][j];
        f[i][j][0]:=min(t1,t2);
        t1:=f[i][j-1][1]+(acc[j]-acc[j-1])*s[i][j-1];
        t2:=f[i][j-1][0]+(acc[j]-acc[i])*s[i][j-1];
        f[i][j][1]:=min(t1,t2);
        end;
    end;
writeln(min(f[1][n][0],f[1][n][1]));
close(input);
close(output);
end.
