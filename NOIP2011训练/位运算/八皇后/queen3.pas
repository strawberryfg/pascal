var t,i,n,sum,upperlim,a,b,c,d,ta,tb:longint;
    pd:boolean;
procedure work(dep,row,ld,rd:longint);
var p,pos,tmp:longint;
begin
if row<>upperlim then
   begin
   if dep>n then exit;
   if not pd then
      begin
      if (dep<>a)and(dep<>c) then tmp:=not (row or ld or rd)
                else if dep=a then tmp:=not (row or ld or rd or ta)
                        else if dep=c then tmp:=not (row or ld or rd or tb);
      end
   else
      begin
      if dep<>a then tmp:=not (row or ld or rd)
                else tmp:=not (row or ld or rd or ta);
      end;
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
    readln(n,a,b,c,d);
    upperlim:=(1 shl n)-1;
    if a<>c then
       begin
       pd:=false;
       ta:=1 shl (n+1-b-1);
       tb:=1 shl (n+1-d-1);
       end
    else
       begin
       pd:=true;
       ta:=(1 shl (n+1-b-1))xor (1 shl (n+1-d-1));
       end;
    sum:=0;
    work(1,0,0,0);
    writeln(sum);
    end;
end.
