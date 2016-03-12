var t,i,n,sum,upperlim,a,b,tt:longint;
procedure work(dep,row,ld,rd:longint);
var p,pos,tmp:longint;
begin
if row<>upperlim then
   begin
   if dep>n then exit;
   if dep<>a then tmp:=not (row or ld or rd)
             else tmp:=not (row or ld or rd or tt);
   pos:=upperlim and tmp;
   while pos<>0 do
    begin
    p:=pos and (not pos+1);
    pos:=pos-p;
    work(dep+1,row+p,(ld+p)shl 1,(rd+p)shr 1);
    end;
   end
else
   inc(sum);

end;
begin
readln(t);
for i:=1 to t do
    begin
    readln(n,a,b);
    upperlim:=(1 shl n)-1;
    tt:=1 shl (n+1-b-1);
    sum:=0;
    work(1,0,0,0);
    writeln(sum);
    end;
end.
