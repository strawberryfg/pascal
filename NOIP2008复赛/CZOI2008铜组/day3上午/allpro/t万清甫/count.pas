var n,k,i,j:longint;
    t:string;
    a:array[0..9]of longint;
procedure print;
var i:longint;
begin
for i:=0 to 9 do
    writeln(a[i]);
end;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    str(i,t);
    for j:=1 to length(t) do
        inc(a[ord(t[j])-48]);
    end;
print;
close(input);
close(output);
end.