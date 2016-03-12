var  j,i,p,q,n,s:longint;
        a:array[1..1000]of longint;
begin
        assign(input,'num.in');
        assign(output,'num.out');
        reset(input);
        rewrite(output);
        readln(n);
        for i:=1 to n do
        readln(a[i]);
        p:=0;
        q:=0;
        s:=0;
        for i:=1 to n do
        begin
                for j:=1 to i-1 do
                if a[j]>a[i] then inc(p);
                for j:=i+1 to n do
                if a[j]>a[i] then inc(q);
                if p=q then inc(s);
                p:=0;
                q:=0;
        end;
        writeln(s);
        close(input);
        close(output);
end.
