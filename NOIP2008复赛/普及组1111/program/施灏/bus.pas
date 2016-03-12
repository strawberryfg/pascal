var a:string;
    b:array[1..25000] of longint;
    n,d,i,t,k,pd1,pd2:longint;
begin
        assign(input,'bus.in');
        reset(input);
        assign(output,'bus.out');
        rewrite(output);
        readln(n,d);
        read(a);
        for i:=1 to n do
            if a[i]='H' then begin b[i]:=1;inc(t);end
                        else begin b[i]:=-1;inc(k);end;
        if (t=n) or (k=n) then begin writeln(1);close(input);close(output);halt;end;
        k:=0;
        t:=0;
        repeat
        inc(k);
        if  b[k]=1  then inc(pd1)
                    else inc(pd2);
        if (pd1-pd2>d) or (pd2-pd1>d)then begin pd1:=0;pd2:=0;inc(t);end;
        until k=n;
        writeln(t);
        close(input);
        close(output);
end.
