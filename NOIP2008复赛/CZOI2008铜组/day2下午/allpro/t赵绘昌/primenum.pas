var n,j,i,k:longint;
function pan(a:longint):boolean;
  var i:longint;
  begin
  pan:=true;
  if a=1 then begin pan:=false;exit;end;
  if a=2 then exit;
  for i:=2 to trunc(sqrt(a)) do
      if a mod i=0 then begin pan:=false; exit; end;
  end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
k:=0;
while not eof do
      begin
      read(n);
      if pan(n) then inc(k);
      end;
writeln(k-1);
close(input);
close(output);
end.
