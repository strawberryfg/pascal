var   n,i,j:longint;
        si:string;
        ch:char;
        a:array['0'..'9']of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
read(n);
for i:=1 to n do
        begin
        str(i,si);
        for j:=1 to length(si) do
            inc(a[si[j]]);
        end;
for  ch:='0' to '9' do
        writeln(a[ch]);
close(input);
close(output);
end.