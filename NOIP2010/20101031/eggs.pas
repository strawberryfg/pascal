var f:array[1..17] of longint;
    m,n,t,i,j:longint;
begin
assign(input,'eggs.in');
reset(input);
readln(m,n);
close(input);
t:=trunc(ln(n)/ln(2))+1;
assign(output,'eggs.out');
rewrite(output);
if m>=t
   then writeln(t)
   else begin
        for i:=1 to m do
            f[i]:=1;
        if f[m]>=n
           then writeln(1)
           else if m=1
                   then writeln(n)
                   else for i:=2 to n do
                            begin
                            for j:=m downto 2 do
                                begin
                                f[j]:=f[j-1]+f[j]+1;
                                if (j=m) and (f[j]>=n)
                                   then begin
                                        writeln(i);
                                        close(output);
                                        exit;
                                        end;
                                end;
                            f[1]:=i;
                            if (m=1) and (f[1]>=n)
                               then begin
                                    writeln(i);
                                    break;
                                    end;
                            end;
        end;
close(output);
end.
