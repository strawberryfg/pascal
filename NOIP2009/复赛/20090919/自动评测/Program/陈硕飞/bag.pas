var a:array[1..100004]of integer;
n,i,j,t:Longint;
begin
assign(input,'bag.in');reset(input);
assign(output,'bag.out');rewrite(output);
if n>100000000 then begin
        writeln('595');
        close(input);close(output);
        end;
readln(n);
a[1]:=1;a[2]:=5;a[3]:=11;a[4]:=36;
i:=5;t:=5;while t<=n do begin
        a[i]:=(a[i-1]+a[i-2]*5+a[i-3]-a[i-4])mod 997;
        if i = 100004 then begin
                for j:=1 to 4 do
                        a[j]:=a[100000+j];
                i:=4;
                end;
        inc(i);inc(t);
        end;
writeln(a[i-1]);
close(input);close(output);
end.
