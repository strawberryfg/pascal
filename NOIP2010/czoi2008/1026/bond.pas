var n,i,j,sum:longint;
    max:extended;
    hash,a:array[0..25]of longint;
    f:array[1..25,1..25]of extended;
procedure work(dep:longint;now:extended);
var i,j:longint;
begin
if now<max then exit;
if dep>n then
   begin
   if now>max then max:=now;
   inc(sum);
   exit;
   end;
for i:=1 to n do
    begin
    if hash[i]=0 then
       begin
       hash[i]:=1;
       a[dep]:=i;
       work(dep+1,now*f[dep,i]);
       for j:=dep+1 to n do hash[a[j]]:=0;
       hash[i]:=0;
       a[dep]:=0;
       end;
    end;
end;
begin
assign(input,'bond.in');
reset(input);
assign(output,'bond.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(f[i,j]);
        f[i,j]:=f[i,j]/100;
        end;
    readln;
    end;
work(1,1);
writeln((max)*100:0:6);
close(input);
close(output);
end.