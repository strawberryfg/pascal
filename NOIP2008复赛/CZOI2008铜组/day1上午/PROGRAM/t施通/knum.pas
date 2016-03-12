var
        i,j,n,k,t:longint;
        a:array[1..20000] of longint;
begin
        assign(input,'knum.in');
        assign(output,'knum.out');
        reset(input);
        rewrite(output);
        read(n,k);
        for i:=1 to n do
                read(a[i]);
        for i:=1 to k+1 do
                for j:=n downto i+1 do
                        if a[j]>a[j-1] then
                        begin
                                t:=a[j];
                                a[j]:=a[j-1];
                                a[j-1]:=t;
                        end;
        writeln(a[k]);
        close(input);
        close(output);
end.