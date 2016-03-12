var s,t:longint;
begin
assign(input,'car.in');reset(input);
assign(output,'car.out');rewrite(output);
read(s,t);
if s<=10 then writeln(s / 100:0:2);
if (s>10)and(s<=20) then writeln(s / 90:0:2);
if (s>20)and(s<=30) then writeln(s / 80:0:2);
if (s>30)and(s<=40) then writeln(s / 75:0:2);
if s>40 then writeln(s / 70:0:2);
close(input);
close(output);
end.