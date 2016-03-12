var n,i,j:longint;
    s:string;
    a:array[0..9]of longint;
begin
assign(input,'count.in');reset(input);
assign(output,'count.out');rewrite(output);
readln(n);
for i:=1 to n do
        begin
        str(i,s);
        for j:=1 to length(s) do
                inc(a[ord(s[j])-48]);
        end;
for i:=0 to 9 do
        writeln(a[i]);
close(input);
close(output);
end.
