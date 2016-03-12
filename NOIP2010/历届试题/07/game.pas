var n,m,i,j,t,k:longint;
    sum,fmax,res1,res2:int64;
    two:array[0..32]of longint;
    a:array[1..100,0..100]of longint;
    f:array[1..100,0..100]of int64;
function max(a,b:int64):int64;
begin
if a<b then exit(b) else exit(a);
end;
begin
assign(input,'game.in');
reset(input);
assign(output,'game.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    for j:=1 to m do
        read(a[i,j]);
    readln;
    end;
two[0]:=1;
for i:=1 to m do two[i]:=two[i-1]*2;
sum:=0;
for i:=1 to n do
    begin
    fillchar(f,sizeof(f),0);
    fmax:=0;
    for j:=1 to m do
        begin

        for k:=j-1 to m do
            begin
            t:=m-k+j;   //m+1-(k-(j-1))
            if t<=m then
               res1:=int64(f[j,k-1])+int64(a[i,t])*int64(two[k])
            else res1:=0;
            if j-1>=1 then
               res2:=int64(f[j-1,k-1])+int64(a[i,j-1])*int64(two[k])
            else res2:=0;
            f[j,k]:=max(res1,res2);
            end;
        if f[j,m]>fmax then fmax:=f[j,m];
        end;
    sum:=sum+fmax;
    end;
writeln(sum);
close(input);
close(output);
end.