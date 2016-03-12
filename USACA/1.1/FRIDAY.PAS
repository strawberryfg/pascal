{
ID:xiaweiy1
PROG:friday
LANG:PASCAL
}
var week:array[0..6]of longint;
    i,j,t,n:longint;
begin
assign(input,'friday.in');
reset(input);
assign(output,'friday.out');
rewrite(output);
readln(n);
for i:=1900 to 1900+n-1 do
    begin
    for j:=1 to 12 do
        begin
        case j of
             1:if i=1900 then t:=13 else t:=t+31;
             3:if (i mod 400=0)or((i mod 100<>0)and(i mod 4=0)) then t:=t+29 else t:=t+28;
             2,4,6,8,9,11:t:=t+31;
             5,7,10:t:=t+30;
             12:t:=t+30;
        end;
        inc(week[t mod 7]);
        end;
    end;
writeln(week[6],' ',week[0],' ',week[1],' ',week[2],' ',week[3],' ',week[4],' ',week[5]);
close(input);
close(output);
end.