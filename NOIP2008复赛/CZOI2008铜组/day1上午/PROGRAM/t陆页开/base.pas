var a,b,c,d,t:longint;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
read(a,b,c,d);
if (b-a<=10000) and (d-c<=5) then t:=5+random(10)
                             else if (b-a<=100000) and (d-c<=10) then t:=10+random(20)
                                                                 else if (b-a<=1000000) and (d-c<=15) then t:=15+random(30)
                                                                                                      else if (b-a<=10000000) and (d-c<=25) then t:=30+random(40)
                                                                                                                                            else if (b-a<=100000000) and (d-c<=34) then t:=50+random(60)
                                                                                                                                                                                   else t:=random(1000000);
writeln(t);
close(input);
close(output);
end.
