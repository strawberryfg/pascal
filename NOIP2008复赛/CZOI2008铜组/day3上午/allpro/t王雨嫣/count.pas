var a:string;
    k:char;
    n,i,m,j:longint;
    count:array['0'..'9']of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    str(i,a);
    for j:=1 to length(a) do
        inc(count[a[j]]);
    end;
for k:='0' to '9' do
    writeln(count[k]);
close(input);
close(output);
end.