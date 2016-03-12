var n,d,i,js,js2,total,s,s2:longint;
        str:string;
        a:array[1..10000]of longint;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
readln(str);
for i:=1 to n do
        if str[i]='H' then a[i]:=-1
                        else a[i]:=1;
for i:=1 to n do
        s2:=s2+a[i];
if abs(s2)=n then begin writeln(1);close(input);close(output);halt; end;
s2:=0;
for i:=1 to n do
        s:=s+a[i];
js:=n+1;
while js2<>n do
begin
if (s>d*-1)and(s<d) then
                        begin
                        writeln(1);
                        close(input);
                        close(output);
                        halt; end
                    else if (s<d*-1) then
                        begin
                        while s<d*-1 do
                                begin
                                dec(js);
                                s:=s-a[js];
                                end;
                        inc(total);
                        end
                    else if (s>d) then
                        begin
                        while s>d do
                                begin
                                dec(js);
                                s:=s-a[js];
                                end;
                        inc(total);
                        end;
inc(js2,js);
for i:=js+1 to n do
        a[i-js]:=a[i];
for i:=n-js+1 to n do
        a[i]:=0;
for i:=1 to n-js do
        s2:=s2+a[i];
if abs(s2)=n-js then begin writeln(total+1);close(input);close(output);halt; end;
s2:=0;
n:=n-js;
js:=0;
end;
writeln(total);
close(input);
close(output);
end.
