var n,i:longint;
    v,num,f:array[0..101] of longint;
    son:array[0..101,0..101] of longint;
function tree(dep:longint):longint;
var max,i,x:longint;
begin
max:=0;
if num[dep]=0 then exit(v[dep]);
if f[dep]<>0 then exit (f[dep]);
for i:=1 to num[dep] do
    begin
    x:=tree(son[dep,i]);
    if x>max then max:=x;
    end;
f[dep]:=v[dep]+max;
exit(v[dep]+max);
end;
begin
assign(input,'tree.in');reset(input);
assign(output,'tree.out');rewrite(output);
read(n);
fillchar(f,sizeof(f),0);
for i:=1 to n do
    begin
    read(v[i]);
    if not(eoln) then
                 while not(eoln) do
                 begin
                        inc(num[i]);
                        read(son[i,num[i]]);
                 end;
    end;
writeln(tree(1));
close(input);
close(output);
end.