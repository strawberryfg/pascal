var i,j,k,max,o:longint;
function ok(p,q:longint):boolean;
var a,ii:integer;
    c:array[1..100] of integer;
  begin
    a:=0;
    repeat
      inc(a);
      c[a]:=p mod q;
      p:=p div q;
    until p=0;
    ok:=true;
    for ii:=1 to a do
      if c[ii]<>c[a+1-ii] then ok:=false;
  end;
begin
  assign(output,'bas.pas');
  rewrite(output);
  for i:=10 to 44300 do
    begin
      k:=0;
      write('(');
      for j:=2 to 36 do
        if ok(sqr(i),j) then begin inc(k);if k=5 then write(j) else write(j,',');end;
      if k<>0 then max:=i;
      for j:=k+1 to 5 do
        if j=5 then write(0) else write(0,',');
      write(')');
      if (i-10+1)mod 5=0 then writeln(',') else write(',');
    end;
  close(output);
end.