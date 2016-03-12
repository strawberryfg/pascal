var n,i:longint;sum:array[0..9]of longint;
procedure fj(a:longint);
var ai:string;j,r,k:longint;
begin
str(a,ai);
for j:=1 to length(ai) do
    begin
    r:=a mod 10;
    a:=a div 10;
    for k:=0 to 9 do
        if r=k then inc(sum[k]);
    end;
end;
begin
assign(input,'count.in');
assign(output,'count.out');
reset(input);rewrite(output);
readln(n);
for i:=1 to n do
    fj(i);
for i:=0 to 9 do
    writeln(sum[i]);
close(input);
close(output);
end.