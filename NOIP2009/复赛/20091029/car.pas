var a:array[1..6]of longint;
    time:array[1..10000]of real;
    i,j,s,t:longint;
    min:real;
begin
assign(input,'car.in');
reset(input);
assign(output,'car.out');
rewrite(output);
readln(s,t);
a[1]:=100;
a[2]:=90;
a[3]:=80;
a[4]:=75;
a[5]:=70;
time[1]:=0.1;
for i:=2 to s div 10 do
    begin
    if i<=5 then min:=i*10/a[i] else min:=i*10/70;
    for j:=1 to i div 2 do
        begin
        if time[j]+time[i-j]+t/60<min then min:=time[j]+time[i-j]+t;
        end;
    time[i]:=min;
    end;
writeln(time[s div 10]:0:2);
close(input);
close(output);
end.