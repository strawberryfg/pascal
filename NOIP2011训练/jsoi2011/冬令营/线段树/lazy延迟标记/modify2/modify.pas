var n,q,i,a,b,delta,j,ans:longint;
    sum,v:array[0..1000000]of longint;
begin
assign(input,'modify.in');
reset(input);
assign(output,'f:\modify.out');
rewrite(output);
readln(n,q);
for i:=1 to n do
    begin
    read(v[i]);
    sum[i]:=sum[i-1]+v[i];
    end;
for i:=1 to q do
    begin
    readln(a,b,delta);
    ans:=0;
    for j:=a to b do
        begin
        v[j]:=v[j]+delta;
        ans:=ans+v[j];
        end;
    write(ans,' ');
    end;
writeln;
close(input);
close(output);
end.