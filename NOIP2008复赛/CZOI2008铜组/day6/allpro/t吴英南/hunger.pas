var a,i,j,l,max:longint;
    b,c,d:array[-1..1001]of longint;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(a);
for i:=1 to a do
    readln(b[i],c[i]);
d[1]:=c[1]-b[1];
for i:=1 to a do
    begin
    max:=0;
    for j:=1 to i do
        if (b[i]>c[j])and(d[j]>max) then begin max:=d[j];l:=j;end;
    d[i]:=c[i]-b[i]+max+1;
    end;
max:=0;
for i:=1 to a do
    if max<d[i] then max:=d[i];
writeln(max);
close(output);
close(input);
end.