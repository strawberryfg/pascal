var n,i,t1,j,k,sum:longint;
    a,b,c:array[1..10000]of longint;
function calc(a,b:longint):longint;
var r:longint;
begin
r:=a mod b;
while (r<>0) do
  begin
  a:=b;
  b:=r;
  r:=a mod b;
  end;
exit(b);
end;
begin
assign(input,'squ.in');
reset(input);
assign(output,'squ.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    if n mod i=0 then
       begin
       t1:=n div i+1;
       for j:=1 to t1 div 2 do
           begin
             k:=t1-j;
               if calc(j*i,k*i)<>i then continue;
               if (j+k-1)*i=n then
                  begin
                  inc(sum);
                  end;

           end;
       end;
    end;
writeln(sum);
close(input);
close(output);
end.