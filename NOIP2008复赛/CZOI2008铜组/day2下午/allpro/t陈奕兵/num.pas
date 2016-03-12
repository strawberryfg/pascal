var total,a,i,j,left,right:longint;
    n:array[1..1000]of integer;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(a);
for i:=1 to a do
    readln(n[i]);
total:=0;
for i:=1 to a do
    begin
    left:=0;
    right:=0;
    for j:=1 to a do
        if (j<i)and(n[j]>n[i]) then inc(left)
                               else if (j>i)and(n[j]>n[i])
                                    then inc(right);
        if left=right then inc(total);
    end;
writeln(total);
close(input);
close(output);
end.