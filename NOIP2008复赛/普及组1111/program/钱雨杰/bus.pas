var n,d,h,j,i:longint;
    str:string;

begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
    readln(n,d);
    readln(str);
    for i:=1 to n do
        if str[i]='H' then inc(h)
                      else inc(j);
    if abs(h-j)>d then writeln(2)
                  else writeln(1);
close(input);
close(output);
end.