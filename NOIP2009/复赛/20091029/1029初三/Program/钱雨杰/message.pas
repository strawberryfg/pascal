var a:array[1..1000] of record
                          co:integer;
                          sonnum:integer;
                          son:array[1..1000] of integer;
                        end;
    g:array[1..1000,1..1000] of boolean;
    i,j,m,n,x,y:longint;
    s:string;

begin
assign(input,'message.in');
reset(input);
assign(output,'message.out');
rewrite(output);
    readln(n,m);
    for i:=1 to n do
        a[i].co:=i;
    for i:=1 to m do
        begin
        readln(x,y);
        g[x,y]:=true;
        if a[x].co=a[y].co then continue;
        inc(a[x].sonnum);
        a[x].son[a[x].sonnum]:=y;
        a[y].co:=a[x].co;
        for j:=1 to a[y].sonnum do
            a[a[y].son[j]].co:=a[x].co;
        end;
    for i:=1 to n do
        begin
        s:='F';
        for j:=1 to n do
            if (a[i].co=a[j].co)and(g[j,i]=true)
               then begin s:='T'; break; end;
        writeln(s);
        end;
close(input);
close(output);
end.