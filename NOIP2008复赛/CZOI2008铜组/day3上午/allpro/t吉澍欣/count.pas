var i,n,t,j:longint;
    num:array[0..9] of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
    fillchar(num,sizeof(num),0);
    for i:=1 to n do
        begin
        t:=i;
        while t>0 do
              begin
              inc(num[t mod 10]);
              t:=t div 10;
              end;
        end;
    for j:=0 to 9 do
        writeln(num[j]);
close(input);
close(output);
end.
