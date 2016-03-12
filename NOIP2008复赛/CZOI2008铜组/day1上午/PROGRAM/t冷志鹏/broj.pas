program broj;
var i,n,w,x,count:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
        readln(n);
        x:=n;
        count:=0;
        while x<>0do
        begin
        x:=x div 10;
        inc(count);
        end;
        for i:=1 to count-1 do
                w:=w+i*9*10**(i-1);
        w:=w+count*(n-10**(count-1)+1);
        writeln(w);
close(input);
close(output);
end.

