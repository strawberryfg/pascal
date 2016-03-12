var i,n,total,t,j,m,maxx:longint;
    sum,v,hash,max:array[1..101]of longint;
    from:array[1..101,1..101]of longint;
begin
assign(input,'tree.in');
reset(input);
assign(output,'tree.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(v[i]);
    total:=0;
    while not eoln do
          begin
          read(t);
          inc(total);
          inc(sum[t]); from[t,sum[t]]:=i;
          end;
    if total=0 then hash[i]:=1;
    end;
max[1]:=v[1];
for i:=2 to n do
    begin
    m:=0;
    for j:=1 to sum[i] do
        begin
        if max[from[i,j]]>m then m:=max[from[i,j]];
        end;
    max[i]:=m+v[i];
    if (hash[i]=1)and(max[i]>maxx) then maxx:=max[i];
    end;
writeln(maxx);
close(input);
close(output);
end.