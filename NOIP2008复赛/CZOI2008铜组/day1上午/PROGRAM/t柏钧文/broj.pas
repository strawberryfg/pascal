var  n,i,sum1,l,j,sum,ln:longint;
     sn,lsum:string;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
read(n);
str(n,sn);
ln:=length(sn);
sum:=0;
for i:=1 to ln-1 do
    begin
    sum1:=1;
    for j:=1 to i-1 do
        sum1:=sum1*10;
    sum:=sum+9*sum1*i;
    end;
sum1:=1;
for i:=1 to ln-1 do
    sum1:=sum1*10;
sum:=sum+(n-sum1+1)*ln;
writeln(sum);
close(input);
close(output);
end.