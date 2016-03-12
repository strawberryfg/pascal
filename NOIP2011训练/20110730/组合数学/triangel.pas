var n,m,ta,tb,i,j,k,r:longint;
    t,res,a,b,x,y:qword;

    pd:boolean;
function calc(u,v:longint):qword;
begin
exit(qword(u)*qword(u-1)div 2*qword(u-2)div 3);
end;
begin
assign(input,'triangel.in');
reset(input);
assign(output,'triangel.out');
rewrite(output);
readln(n,m);
while not((n=0)and(m=0)) do
  begin
  t:=(n+1)*(m+1);
  res:=calc(t,3);
  a:=calc(m+1,3);
  a:=qword(a)*qword(n+1);
  b:=calc(n+1,3);
  b:=qword(b)*qword(m+1);
  pd:=false;
  y:=0;
  for i:=n downto 1 do
      begin
      for j:=m downto 1 do
          begin
          ta:=i; tb:=j; if i<j then begin ta:=ta+tb; tb:=ta-tb; ta:=ta-tb; end;
          r:=ta mod tb;
          while r<>0 do
            begin
            ta:=tb;
            tb:=r;
            r:=ta mod tb;
            end;
          if tb>1 then
             begin
             x:=(m-j+1)*(n-i+1);
             y:=y+(tb-1)*qword(x)*2;
             end;
          end;
      if pd then break;
      end;

  res:=qword(res)-qword(a)-qword(b)-qword(y);
  writeln(res);
  readln(n,m);
  end;
close(input);
close(output);
end.
