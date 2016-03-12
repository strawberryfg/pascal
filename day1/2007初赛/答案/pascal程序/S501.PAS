program S501;
var bound,m,n,i,j,b,p:integer;
    gr:array[0..14] of integer;
begin
 bound:=1;
 writeln('input n,m');
 readln(n,m);
 for i:=1 to n do bound:=bound*2 ;
 if (m<0) or(m>=bound) then
   begin
     writeln('Data error!');
     exit ;
   end;
 b:=1;
 for i:=1 to n do
  begin
    p:=0; b:=b*2;
    for j:=0 to m do
      if (j mod b-(b div 2))=0  then
        p:=1-p;
   gr[i]:=p;
   end;
 for i:=n downto 1 do
   write(gr[i]);
 writeln;
end.
