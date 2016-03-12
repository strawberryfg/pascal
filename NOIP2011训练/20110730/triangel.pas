var n,m,i,j,x,t:longint;
    ans:qword;
function solve(a,b:longint):longint;
var ans1,ans2,ans3,ans4,ta,tb,sum,i,j:longint;
    k:extended;
begin
ans1:=(b-2)*2*2+(a-2)*2*2+4+(b-2)*2+(a-2)*2;
ans2:=0;
ans3:=0;
if (b-2>0)and(a-2>0) then ans3:=(b-2)*(a-2)*4;
ta:=a-1; tb:=b-1;
sum:=0;
for i:=1 to ta-1  do
    begin
    for j:=1 to trunc(tb/ta*i) do
        begin
        k:=i/j;
        if k>ta/tb then inc(sum);
        end;
    end;
ans4:=sum*2*2;
exit(ans1+ans2+ans3+ans4);
end;
begin
assign(input,'triangel.in');
reset(input);
assign(output,'triangel.out');
rewrite(output);
readln(n,m);
while not((n=0)and(m=0)) do
 begin
   ans:=0;
   for i:=1 to n do
       begin
       for j:=1 to m do
           begin
           x:=(m+1-j)*(n+1-i);
           t:=solve(i+1,j+1);
           ans:=qword(ans)+qword(t)*qword(x);
           end;
       end;
 writeln(ans);
 readln(n,m);
 end;
close(input);
close(output);
end.