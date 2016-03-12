var n,i:longint;
    l,j:byte;
    temp:string[8];
    t2:char;
    use:packed array['0'..'9'] of longint;
begin
assign(input,'count.in');
assign(output,'count.out');
reset(input);
readln(n);
close(input);
for i:=1 to n do
    begin
    str(i,temp);
    l:=length(temp);
    for j:=1 to l do
        inc(use[temp[j]]);
    end;
rewrite(output);
for t2:='0' to '9' do
    writeln(use[t2]);
close(output);
end.