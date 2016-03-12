var     c,a:array[0..10000]of boolean;
        n,i,j,l,total,max:longint;
begin
        assign(input,'castle.in');
        reset(input);
        assign(output,'castle.out');
        rewrite(output);
        readln(n);
        fillchar(c,sizeof(c),true);
        max:=10000;
        for i:=1 to n do
        begin
                fillchar(a,sizeof(a),false);
                a[0]:=true;
                total:=0;
                read(l);
                while l<>-1 do
                begin
                        for j:=total downto 0 do
                                if a[j] then a[j+l]:=true;
                        inc(total,l);
                        read(l);
                end;
                if total<max then max:=total;
                for j:=0 to max do if not a[j] then c[j]:=false;
        end;
        i:=max;
        while not c[i] do dec(i);
        writeln(i);
        close(input);
        close(output);
end.
