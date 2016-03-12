var ans,i1,t1,s1,t,i,j,n,s:longint;
    a:array[0..100] of longint;
begin
assign(input,'best.in');
assign(output,'best.out');
reset(input);
rewrite(output);
readln(n);
s:=n;
i:=0;
t:=2;
while t1=0 do
      begin
      if s-t<=0 then break;
      i:=i+1;
      s:=s-t;
      a[i]:=t;
      t:=t+1;
      end;
i1:=i;
s1:=s;
ans:=1;
while s<>0 do
    begin
    j:=j+1;
    if j>s1 then j:=0;
    a[j]:=a[j]+1;
    s:=s-1;
    end;
for i:= 1 to i1 do
    ans:=ans*a[i];
writeln(ans);
close(input);
close(output);
end.