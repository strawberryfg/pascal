program num;
var  n,i,count:longint;
       a:array[1..1000]of longint;
function findleft(x:longint):longint;
var sum,i:longint;
begin
     sum:=0;
     for i:=1 to i do
     begin
          if a[i]>a[x] then sum:=sum+1;
     end;
     findleft:=sum;
end;
function findright(x:longint):longint;
var sum,i:longint;
begin
    sum:=0;
    for i:=n downto x do
    begin
          if a[i]>a[x] then sum:=sum+1;
    end;
    findright:=sum;
end;
begin
assign(input,'num.in');reset(input);
assign(output,'num.out');rewrite(output);
count:=0;
read(n);
for i:=1 to n do
begin
read(a[i]);
end;
for i:=1 to n do
begin
     if findleft(i)=findright(i) then count:=count+1;
end;
writeln(count);
close(input);
close(output);
end.