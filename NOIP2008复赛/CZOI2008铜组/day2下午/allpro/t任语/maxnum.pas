program ex;
var m,n,r:integer;
begin
    assign(input,'maxnum.in');
    reset(input);
    assign(output,'maxnum.out');
    rewrite(output);
    readln(m,n);
    repeat
         r:=m mod n;
         m:=n;
         n:=r;
    until r=0;
    writeln(m);
    close(input);
    close(output);
end.