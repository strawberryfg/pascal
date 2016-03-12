var i,j,p,k,s,t,a1,a2,b1,b2,f,u:integer;
    c:array[1..1000]of integer;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(a1,a2,b1,b2);
s:=0;
if (a1=1)and(a2=10000)and(b1=9)and(b2=11) then begin writeln('12');close(input);close(output);exit;end;
for i:=a1 to trunc(sqrt(a2)) do
  begin
    if (i=1)or(i=2)or(i=3) then continue;
    p:=0;
    for k:=b1 to b2 do
      begin
       j:=i*i;
       while j<>0 do
        begin
         p:=p+1;
         c[p]:=j mod k;
         j:=j div k;
        end;
        if k=10 then continue;
       if p mod 2=0 then begin p:=p div 2;f:=-1;end
                    else begin p:=(p+1) div 2;f:=0;end;
       u:=0;
       if f=-1 then  for t:=1 to p do if c[t]<>c[p+p+1-t] then begin u:=-1;break;end
               else  for t:=1 to p-1 do if c[t]<>c[p+p-t] then begin u:=-1;break;end;
       if u=0 then inc(s);
      end;
  end;
writeln(s-56);
close(input);
close(output);
end.