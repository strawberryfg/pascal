var n,l,i,s,sum,ti:int64;
    t,r:string;
function fun(n:longint):int64;
        var i:longint;s:int64;
        begin
        s:=9;
        for i:=1 to n do
                s:=s*10;
        fun:=s div 10;
        end;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
i:=1;s:=1;
str(n,t);
while i <= length(t)-1 do
        begin
        sum:=sum+i*fun(i);
        s:=s*10;
        inc(i);
        end;
sum:=sum+(i)*(n-s+1);
writeln(sum);
close(input);
close(output);
end.
