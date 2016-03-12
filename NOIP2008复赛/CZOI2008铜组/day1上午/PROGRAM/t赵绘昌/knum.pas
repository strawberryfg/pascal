type arr=array[-32768..32767] of integer;
var chang:arr;
    i,n,k,t,m,l,kk:longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
m:=maxlongint;
l:=-300000;
readln(n,k);
for i:=1 to n do
    begin
    read(t);
    inc(chang[t]);
    if t<m then m:=t;
    if t>l then l:=t;
    end;
for i:=l downto m do
    begin
    if chang[i]>0 then inc(kk);
    if kk=k then
        begin writeln(i);
              close(input);
              close(output);
              halt;
              end;
    end;
close(input);
close(output);
end.


