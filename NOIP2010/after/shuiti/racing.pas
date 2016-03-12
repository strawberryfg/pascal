var m,t,u,f,d,i,sum,tmp,knum:longint;
    a:array[1..100000]of longint;
    s:char;
begin
readln(m,t,u,f,d);
for i:=1 to t do
    begin
    readln(s);
    if s='u' then a[i]:=1
       else if s='f' then a[i]:=2
            else if s='d' then a[i]:=3;
    end;
sum:=0;
for i:=1 to t do
    begin
    tmp:=sum;
    if a[i]=1 then inc(tmp,u+d)
       else if a[i]=2 then inc(tmp,2*f)
            else inc(tmp,u+d);
    if tmp<=m then begin knum:=i;sum:=tmp end
       else break;
    end;
writeln(knum);
end.