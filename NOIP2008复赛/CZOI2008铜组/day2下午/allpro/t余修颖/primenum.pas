var p,t,n,s,i:longint;
        a:array[1..1000]of longint;
function pr(t:longint):integer;
var p:longint;
begin
        for p:=2 to trunc(sqrt(t)) do
        if t mod p=0 then pr:=0
                     else pr:=1;
end;
begin
        assign(input,'primenum.in');
        assign(output,'primenum.out');
        reset(input);
        rewrite(output);

        n:=0;
        while not eof do
        begin
        inc(n);
        readln(a[n]);
        end;
        for i:=1 to n do
        if pr(a[i])=1 then inc(s);
        writeln(s);
        close(input);
        close(output);
end.
