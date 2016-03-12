program num;
var a:array [1..1000]of longint;
    i,j,n,front,back,count:longint;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
        readln(n);
        for i:=1 to n do readln(a[i]);
        count:=0;
        for i:=1 to n do
                begin
                        front:=0;
                        back:=0;
                        for j:=1 to i-1 do if a[j]>a[i] then inc(front);
                        for j:=i+1 to n do if a[j]>a[i] then inc(back);
                        if front=back then inc(count);
                end;
        writeln(count);
close(input);
close(output);
end.
