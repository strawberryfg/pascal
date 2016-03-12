var i,n,tail,tmp,head,tx,ty,last:longint;
    t,k:extended;
    x,y,r,num,nowx,nowy,hash:array[1..10000]of longint;
begin
readln(n);
for i:=1 to n do
    begin
    readln(x[i],y[i],r[i]);
    if (x[i]=0)and(y[i]=0) then tmp:=i;
    end;
tail:=1; head:=1;
nowx[1]:=0; nowy[1]:=0; num[1]:=tmp;
hash[tmp]:=1;
while tail<=head do
  begin
  tx:=nowx[tail]; ty:=nowy[tail];
  for i:=1 to n do
      begin
      if hash[i]=1 then continue;
      t:=(tx-x[i])*(tx-x[i])+(ty-y[i])*(ty-y[i]);
      k:=(r[i]+r[num[tail]])*(r[i]+r[num[tail]]);
      if t=k then
         begin
         last:=i;
         inc(head);
         hash[i]:=1;
         nowx[head]:=x[i]; nowy[head]:=y[i];
         num[head]:=i;
         end;
      end;
  inc(tail);
  end;
writeln(x[last],' ',y[last]);
end.
