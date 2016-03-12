var i,total:longint;
function ok(n:integer):boolean;
var i:integer;
begin
  ok:=true;
  if n=1 then ok:=false else
  begin
    for i:=2 to trunc(sqrt(n)) do if n mod i=0 then begin ok:=false; exit;end
  end;
end;

begin
   assign(input,'primenum.in');
   reset(input);
   assign(output,'primenum.out');
   rewrite(output);
   total:=0;
   while not eof do
   begin
     read(i);
     if ok(i) then inc(total);
     end;
     writeln(total);
     close(input);
     close(output);
end.
