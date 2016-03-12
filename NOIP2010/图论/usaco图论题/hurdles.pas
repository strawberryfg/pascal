var n,m,t,i,x,y,h,j,k,max:longint;
    edge,f:array[1..320,0..320]of longint;
    st,en:array[1..40020]of longint;
begin
assign(input,'hurdles.in');
reset(input);
assign(output,'hurdles.out');
rewrite(output);
readln(n,m,t);
for i:=1 to n do for j:=1 to n do f[i,j]:=maxlongint;
for i:=1 to m do
    begin
    readln(x,y,h);
    inc(edge[x,0]);
    //edge[x,edge[x,0]]:=y;
    f[x,y]:=h;
    end;
for i:=1 to t do
    begin
    readln(st[i],en[i]);
    end;
for k:=1 to n do
    begin
    for i:=1 to n do
        begin
        for j:=1 to n do
            begin
            if (i<>k)and(i<>j)and(k<>j) then
               begin
               if f[i,k]>f[k,j] then max:=f[i,k] else max:=f[k,j];
               if max<f[i,j] then f[i,j]:=max;
               end;
            end;
        end;
    end;
for i:=1 to t do
    begin
    x:=st[i]; y:=en[i];
    if f[x,y]<>maxlongint then writeln(f[x,y])
       else writeln(-1);
    end;
close(input);
close(output);
end.