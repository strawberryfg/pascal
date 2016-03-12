var i,j,t:longint;
    a:array[1..10000] of longint;
function sss(n:longint):boolean;
begin
  if n=1 then sss:=false
         else if (n=2)or(n=3)or(n=5)or(n=7) then sss:=true
                                            else if (n mod 2=0)or(n mod 3=0)or(n mod 5=0)or(n mod 7=0) then sss:=false
                                                                                                       else sss:=true;

end;
begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  i:=0;t:=0;
  while not eof do
    begin
      inc(i);
      readln(a[i]);
    end;
  for j:=1 to i do
    if sss(a[j]) then inc(t);
  writeln(t);
  close(input);
  close(output);
end.
