var i,n,a0,a1,b0,b1,j,t,sum:longint;
function gcd(x,y:longint):longint;
var tx,ty,tmp,r:longint;
begin
 tx:=x; ty:=y; if tx<ty then begin tmp:=tx; tx:=ty; ty:=tmp; end;
 r:=tx mod ty;
while r<>0 do
  begin
  tx:=ty;
  ty:=r;
  r:=tx mod ty;
  end;
exit(ty);
end;
function lcm(x,y:longint):longint;
var t:longint;
begin
t:=gcd(x,y);
exit(x*y div t);
end;
begin
assign(input,'son.in');
reset(input);
{assign(output,'son.out');
rewrite(output);}
readln(n);
for i:=1 to n do
    begin
    readln(a0,a1,b0,b1);
    sum:=0;
    for j:=1 to b1 div a1 do
        begin
        t:=j*a1;
        if (gcd(t,a0)=a1)and(lcm(b0,t)=b1) then
           begin
           inc(sum);
            //writeln(a0,' ',t,' ',a1,' ',b0,' ',b1);
           end;
        end;
    writeln(sum);
    end;
close(input);
close(output);
end.