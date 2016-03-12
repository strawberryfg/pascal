program ac;
var
        i,j,q,l,n,max:longint;
        f:array[1..100,1..100]of longint;
        p:array[1..100,1..100]of boolean;
        flag:boolean;
begin
        assign(input,'concom.in');reset(input);
        assign(output,'concom.out');rewrite(output);
        readln(n);
        for l:=1 to n do
        begin
                read(i,j,q);
                f[i,j]:=q;
                if i>max then max:=i;
                if j>max then max:=j;
        end;
        repeat
                flag:=true;
                for i:=1 to max do
                        for j:=1 to max do
                        if (i<>j) then
                        if (f[i,j]>50)and(not p[i,j]) then
                        begin
                                flag:=false;
                                p[i,j]:=true;
                                for l:=1 to max do
                                        inc(f[i,l],f[j,l]);
                        end;
        until flag;
        repeat
                flag:=true;
                for i:=1 to max do
                        for j:=1 to max do
                        if (i<>j)and(p[i,j]) then
                                for l:=1 to max do
                                        if (i<>l)and(j<>l) then
                                        if (p[j,l])and(not p[i,l]) then
                                        begin
                                                flag:=false;
                                                p[i,l]:=true;
                                        end;
        until flag;
        for i:=1 to max do
                for j:=1 to max do
                if p[i,j] then writeln(i,' ',j);
        close(output);
end.