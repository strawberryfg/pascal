var n,d,i,hsum,jsum,sum,sum2:longint;
    str,nd:string;
begin
assign(input,'bus.in'); 
reset(input);
assign(output,'bus.out'); 
rewrite(output);
readln(n,d);
readln(str);
sum:=0;
sum2:=0;
for i:=1 to n do
    begin
    if str[i]='H' then inc(hsum)
                   else inc(jsum);
    if ((hsum-jsum>3)and(jsum<>0))or((jsum-hsum>3)and(hsum<>0)) then
        begin
        inc(sum);
        if str[i]='H' then begin hsum:=1;jsum:=0;end
                      else begin jsum:=1;hsum:=0;end;
        end;
    end;
hsum:=0;jsum:=0;
for i:=n downto 1 do
    begin
    if str[i]='H' then inc(hsum)
                   else inc(jsum);
    if ((hsum-jsum>3)and(jsum<>0))or((jsum-hsum>3)and(hsum<>0)) then
        begin
        inc(sum2);
        if str[i]='H' then begin hsum:=1;jsum:=0;end
                      else begin jsum:=1;hsum:=0;end;
        end;
    end;
if sum<sum2 then  writeln(sum+1)
            else writeln(sum2+1);
close(input);
close(output);
end.
