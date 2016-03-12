program primenum;
var a:array[1..10000] of longint;
    i,j,total:longint;
function prime(n:longint):boolean;
var k:integer;
begin
  prime:=true;
  for k:=2 to n-1 do
      if n mod k=0 then begin
                          prime:=false;
                          break;
                        end;
end;
begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  i:=0;
  while not eof do
        begin
          inc(i);
          readln(a[i]);
        end;
  total:=0;
  for j:=1 to i do
      if prime(a[j])=true then total:=total+1;
  writeln(total);
  close(input);
  close(output);
end.