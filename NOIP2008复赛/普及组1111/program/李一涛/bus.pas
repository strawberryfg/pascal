var a:array[1..2500]of integer;
    n,d,i,k,h,j,s:integer;
    c:string;
function pd(i:integer):boolean;
var o,p,q:integer;
begin
  p:=0; q:=0;
  for o:=i to n do if a[i]=1 then inc(p) else inc(q);
  if abs(p-q)<=d then pd:=true else pd:=false;
end;
begin
  assign(input,'bus.in');
  reset(input);
  assign(output,'bus.out');
  rewrite(output);
  readln(n,d); readln(c);
  fillchar(a,sizeof(a),0); s:=1;
  for i:=1 to n do if c[i]='H' then inc(a[i]) else a[i]:=a[i]+2;
  for i:=n downto 1 do
  begin
    h:=0; j:=0;
    for k:=1 to i do if a[k]=1 then inc(h) else inc(j);
    if ((abs(h-j)<=d)and(pd(i)))or(h=0)or(j=0) then inc(s) else continue;
  end;
  writeln(s div 2);
  close(input); close(output);
end.
