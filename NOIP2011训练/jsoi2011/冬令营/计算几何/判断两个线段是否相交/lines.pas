var lx,ly,rx,ry,tx,ty,px,py:longint;
function calc(a,b,c,d:longint):longint;
begin
exit(a*d-b*c);
end;
function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
function check:boolean;
var t1,t2:longint;
begin
if (max(lx,rx)>=min(tx,px))or(max(tx,px)>=min(lx,rx)) then
   begin
   if (max(ly,ry)>=min(ty,py))or(max(ty,py)>=min(ly,ry)) then
      begin
      t1:=calc(tx-lx,ty-ly,rx-lx,ry-ly);
      t2:=calc(px-lx,py-ly,rx-lx,ry-ly);
      if ((t1<=0)and(t2>=0))or((t1>=0)or(t2<=0)) then
         begin
         t1:=calc(lx-px,ly-py,tx-px,ty-py);
         t2:=calc(rx-px,ry-py,tx-px,ty-py);
         if ((t1<=0)or(t2>=0))or((t1>=0)or(t2<=0)) then
             exit(true)
         else exit(false);
         end
      else exit(false);
      end
   else exit(false);
   end
else exit(false);
end;
begin
{assign(input,'lines.in');
reset(input);
assign(output,'lines.out');
rewrite(output);}
readln(lx,ly,rx,ry);
readln(tx,ty,px,py);
if check then writeln('jiao')
         else writeln('bujiao');
close(input);
close(output);
end.