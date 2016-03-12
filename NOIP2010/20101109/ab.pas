var a,b,res:qword;
    s1,s2,s:string;
    t:longint;
    mark1,mark2,pd,fu,mark:boolean;
function com(x,y:string):boolean;
var lenx,leny,i:longint;
begin
lenx:=length(x); leny:=length(y);
if lenx<leny then exit(true);
if lenx>leny then exit(false);
for i:=lenx downto 1 do
    begin
    if x[i]>y[i] then exit(false);
    end;
exit(true);
end;
procedure cmp;
var ts:string;
begin
if (mark1=true)and(mark2=true) then
   begin
   delete(s1,1,1);
   delete(s2,1,1);
   fu:=true;
   exit;
   end;
if (mark1=false)and(mark2=false) then
   begin
   exit;
   end;
if (mark1)and(not mark2) then
   begin
   delete(s1,1,1);
   pd:=false;
   if com(s1,s2) then
      begin
      ts:=s1; s1:=s2; s2:=ts;
      fu:=false; pd:=false;
      exit;
      end
   else
      begin
      fu:=true;
      exit;
      end;
   end;
if (not mark1)and(mark2) then
   begin
   delete(s2,1,1);
   pd:=false;
   if com(s1,s2) then
      begin
      ts:=s1; s1:=s2;s2:=ts;
      fu:=true;
      end
   else fu:=false;
   exit;
   end;
end;
begin
assign(input,'ab.in');
reset(input);
assign(output,'ab.out');
rewrite(output);
readln(s);
t:=pos(' ',s);
s1:=copy(s,1,t-1);
delete(s,1,t);
s2:=s;
if s1[1]='-' then mark1:=true else mark1:=false;
if s2[1]='-' then mark2:=true else mark2:=false;
pd:=true;
fu:=false;
cmp;
val(s1,a);
val(s2,b);
if not pd then
   begin
   if fu then write('-');
   res:=qword(a)-qword(b);
   write(res);
   end
else
   begin
   if fu then write('-');
   res:=qword(a)+qword(b);
   write(res);
   end;
writeln;
close(input);
close(output);
end.