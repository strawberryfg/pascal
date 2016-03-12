var a:array[1..100] of record
                         num,data:longint;
                         son:array[1..100] of integer;
                        end;
    i,j,x,n,num,max,t:longint;

begin
assign(input,'tree.in');
reset(input);
assign(output,'tree.out');
rewrite(output);
    readln(n);
    for i:=1 to n do
        begin
        read(a[i].data);
        while not eoln do
            begin
            read(x);
            inc(a[i].num);
            a[i].son[a[i].num]:=x;
            end;
        end;
    for i:=n downto 1 do
        begin
        t:=a[i].data;
        for j:=1 to a[i].num do
            if a[i].data+a[a[i].son[j]].data>t
               then t:=a[i].data+a[a[i].son[j]].data;
        a[i].data:=t;
        if t>max then max:=t;
        end;
    writeln(max);
close(input);
close(output);
end.