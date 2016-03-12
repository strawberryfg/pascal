const mo=1000000009;
var n,m,i,j,r:longint;
    a,f:array[0..1000200]of longint;
begin
assign(input,'NumberPyramids.in');
reset(input);
assign(output,'NumberPyramids.out');
rewrite(output);
readln(n,m);
a[1]:=1;
if n>=21 then writeln(0)
   else begin
        for i:=2 to n do
            for j:=i downto 2 do
                a[j]:=a[j]+a[j-1];
        f[0]:=1;
        r:=1 shl (n-1);
        m:=m-r;
        if (m<0) then writeln(0)
           else begin
                for i:=1 to n do
                    begin
                    for j:=a[i] to m do
                        begin
                        f[j]:=(f[j-a[i]]+f[j])mod mo;
                        end;
                    end;
                end;
        writeln(f[m]);
        end;
close(input);
close(output);
end.