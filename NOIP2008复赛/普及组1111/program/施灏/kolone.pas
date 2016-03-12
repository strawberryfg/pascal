var
    x,ax,bx,dd:string;
    n1,n2,i,j,t,k:longint;
    a,b,c,d:array[1..25000] of string;
begin
        assign(input,'kolone.in');
        assign(output,'kolone.out');
        reset(input);
        rewrite(output);
        readln(n1,n2);
        readln(ax);
        readln(bx);
        for i:=1 to n1 do
            a[i]:=ax[i];
        for i:=1 to n2 do
            b[i]:=bx[i];
        read(t);
        x:=b[t];
        b[t]:=a[1];
        a[1]:=x;
        x:=a[t];
        a[t]:=b[1];
        b[1]:=x;
        if n1=n2 then
                 begin
                 x:=a[1];
                 a[1]:=b[1];
                 b[1]:=x;
                 end
                 else if n1>n2 then     begin
                                        for i:=1 to n1-n2 do
                                        begin
                                        dd:=dd+a[i];
                                        end;
                                        x:=dd;
                                        dd:=b[1];
                                        b[1]:=x;
                                        a[1]:=dd;
                                        end
                 else if n1<n2 then     begin
                                        for i:=1 to n2-n1 do
                                        begin
                                        dd:=dd+b[i];
                                        end;
                                        x:=dd;
                                        dd:=b[1];
                                        b[1]:=x;
                                        a[1]:=dd;
                                        end;

for i:=n1 downto 1 do
    write(a[i]);
for j:=1 to n2 do
    write(b[j]);
writeln;
close(input);
close(output);
end.