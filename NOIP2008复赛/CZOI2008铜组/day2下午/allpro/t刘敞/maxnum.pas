const max=1000;
var a:array[1..max]of longint;
    n,i,s:longint;
function fun(m:longint):boolean;
        var i:longint;
        begin
        fun:=true;
        for i:=1 to n do
                if a[i] mod m<>0 then exit(false);
        end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
n:=0;
s:=maxlongint;
while not eof do
        begin
        inc(n);
        readln(a[n]);
        if a[n]<s then s:=a[n];
        end;
for i:=s downto 1 do
        if fun(i) then break;
writeln(i);
close(input);
close(output);
end.
