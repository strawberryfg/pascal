var n,i,sum,j:longint;
        a,b:array[1..100000]of longint;
begin
assign(input,'seq.in');
assign(output,'seq.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
        begin
        readln(a[i]);
        b[i]:=a[i]*2;
        end;
sum:=0;
a[1]:=b[1] div 2;
for i:=1 to n do
        begin
        a[i+1]:=b[i]-a[i];
        if a[i+1]<a[i] then
                begin
                if odd(b[i]) then a[i+1]:=b[i] div 2+1
                             else a[i+1]:=b[i] div 2;
                for j:=i downto 1 do
                        begin
                        a[i]:=b[i]-a[i+1];
                        if a[i+1]<a[i] then begin writeln('0');halt;end;
                        end;
                end;
        end;
inc(sum);
while true do
        begin
        dec(a[1]);
        for i:=1 to n do
                begin
                a[i+1]:=b[i]-a[i];
                if a[i+1]<a[i] then begin writeln(sum);halt;end;
                end;
        inc(sum);
        end;
    close(input);close(output);
end.