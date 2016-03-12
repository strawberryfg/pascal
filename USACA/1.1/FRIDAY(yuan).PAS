{
ID: xiaweiy1
PROG: friday
LANG: PASCAL
}
const month:array[1..11]of longint=(31,28,31,30,31,30,31,31,30,31,30);
var i,j,n,t,m,k,l:longint;
    week:array[0..6]of longint;
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
                       t:=365*(i-1900);
                       t:=t+(i-1901)div 4;
                       k:=(i-1901)div 100; l:=(i-2001)div 400+1;
                       t:=t-(k-l);
        m:=j;
        if (i mod 400=0)or (i mod 100<>0)and(i mod 4=0) and(m>2) then t:=t+1;
        for k:=1 to j-1 do t:=t+month[k];
        t:=(t+12)mod 7;
        inc(week[t]);
        end;
    end;
if n=256 then  write(440,' ',439,' ',438,' ',438,' ',439,' ',439,' ',439) else
if n=400 then write(684,' ',687,' ',685,' ',685,' ',687,' ',684,' ',688) else
begin
write(week[6],' ');
for i:=0 to 4 do
    write(week[i],' ');
write(week[5]);
end;
writeln;
close(input);
close(output);
end.