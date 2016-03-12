var     a,b:array[1..100,1..100]of longint;
        i,j,k,t,l,n,min:longint;
begin
        assign(input,'stone.in');
        reset(input);
        assign(output,'stone.out');
        rewrite(output);
        readln(n);
        min:=maxlongint;
        for i:=1 to n do read(a[i,1]);
        for i:=1 to n-1 do
        begin
                t:=a[i,1];
                a[i,1]:=a[i+1,1];
                a[i+1,1]:=t;
                b:=a;
                for j:=2 to n do
                        for k:=1 to n-j+1 do
                        begin
                                a[k,j]:=a[k,j-1]+a[k+j-1,1];
                                b[k,j]:=b[k+1,j-1];
                                for l:=1 to j-1 do
                                        if b[k,l]+b[k+l,j-l]<b[k,j] then b[k,j]:=b[k,l]+b[k+l,j-l];
                                if b[k,j]>b[k,j-1] then b[k,j]:=b[k,j-1];
                                if j=2 then b[k,j]:=0;
                                inc(b[k,j],a[k,j]);
                        end;
                t:=a[i,1];
                a[i,1]:=a[i+1,1];
                a[i+1,1]:=t;
                if b[1,n]<min then min:=b[1,n];
        end;
        writeln(min);
        close(input);
        close(output);
end.
