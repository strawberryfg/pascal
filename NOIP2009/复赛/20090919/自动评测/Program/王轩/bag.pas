var f:array[0..1000000,1..6]of longint;
    n,i:longint;
begin
assign(input,'bag.in');
assign(output,'bag.out');
reset(input);
rewrite(output);
fillchar(f,sizeof(f),0);
readln(n);
f[1,1]:=1;
f[1,2]:=1;
f[1,3]:=1;
f[1,5]:=1;
f[1,6]:=1;
for i:=2 to n do
    begin
    f[i,1]:=f[i-1,6];
    f[i,2]:=(f[i-1,6]+f[i-1,3]) mod 997;
    f[i,3]:=(f[i-1,6]+f[i-1,2]) mod 997;
    f[i,4]:=f[i-1,5];
    f[i,5]:=(f[i-1,6]+f[i-1,4]) mod 997;
    f[i,6]:=(f[i-1,6]+f[i-1,1]+f[i-1,2]+f[i-1,3]+f[i-1,5]) mod 997;
    end;
writeln(f[n,6] mod 997);
close(input);
close(output);
end.