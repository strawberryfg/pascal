var t,i,n,sum,upperlim:longint;
procedure work(dep,row,ld,rd:longint);
var p,pos:longint;
begin
if row<>upperlim then
   begin
   if dep>n then exit;
   pos:=upperlim and not (row or ld or rd);
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
    readln(n);
    upperlim:=(1 shl n)-1;
    sum:=0;
    work(1,0,0,0);
    writeln(sum);
    end;
end.