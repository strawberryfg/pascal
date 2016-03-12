var a:array[1..1000]of longint;
    s,n,i,j,k,tj,tk:longint;
begin
assign(input,'num.in');reset(input);
assign(output,'num.out');rewrite(output); 
readln(n);
for i:=1 to n do
        readln(a[i]);
s:=0;
for i:=1 to n do
        begin
        tj:=0;tk:=0;
        for j:=1 to i-1 do
                if a[j]>a[i] then inc(tj);
        for k:=i+1 to n do
                if a[k]>a[i] then inc(tk);
        if tj=tk then inc(s);
        end;
writeln(s);
close(input);
close(output);
end.
