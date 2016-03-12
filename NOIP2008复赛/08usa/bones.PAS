var i,j,k,s1,s2,s3,t,normal:longint;
    a:array[0..80]of longint;
begin
assign(input,'bones.in');
reset(input);
assign(output,'bones.out');
rewrite(output);
readln(s1,s2,s3);
normal:=0;
for i:=1 to s1 do
    for j:=1 to s2 do
        for k:=1 to s3 do
            begin
            t:=i+j+k;
            inc(a[t]);
            if (a[t]>a[normal])and(normal<>t) then normal:=t;
            end;
writeln(normal);
close(output);
end.