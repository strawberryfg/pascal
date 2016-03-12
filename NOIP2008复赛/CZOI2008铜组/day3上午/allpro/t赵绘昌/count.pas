var a,b:string;
    i,j,k,n,l:longint;
    ff,nn:char;
    kk:array['0'..'9'] of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    a:='';
    str(i,a);
    for j:=1 to length(a) do
        inc(kk[a[j]]);
    end;
for ff:='0' to '9' do
    writeln(kk[ff]);
close(input);
close(output);
end.