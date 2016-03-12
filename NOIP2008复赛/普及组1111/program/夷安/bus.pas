var a1,a2:array[0..2500] of integer;
    c,max:array[0..2500]of longint;
    n,s,d,i,j,k:longint;
    p:char;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
readln(n,d);
for i:=1 to n do
    begin
    read(p);
    if p='H' then begin c[i]:=c[i-1]+1;a1[i]:=a1[i-1]+1;end
             else begin c[i]:=c[i-1]-1;;a2[i]:=a2[i-1]+1;end;
    end;
for i:=1 to n do
    for j:=0 to i-1 do
        if (max[i]=0)or(max[i]>max[j]+1)
        then if (abs(c[i]-c[j])<=d)
        or(a1[i]>=i-j)
        or(a2[i]>=i-j)
        then max[i]:=max[j]+1;
writeln(max[n]);
close(input);
close(output);
end.
