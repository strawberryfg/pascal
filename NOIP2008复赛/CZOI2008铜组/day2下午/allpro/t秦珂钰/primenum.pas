program primenum(input,output);
var a:array[1..1000] of integer;
    total,i,j:integer;

function prime(n:integer):boolean;
var i:integer;
begin
  if n mod 2 =0 then prime:=false;
                     for i:=3 to trunc(sqrt(n)) do
                       if n mod i=0 then prime:=false
                                    else prime:=true;
end;

begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  i:=0;
  while not eof do
  begin
    i:=i+1;
    readln(a[i]);
  end;
  total:=0;
  for j:=1 to i do
    if a[j]=2 then total:=total+1
              else if prime(a[j]) then total:=total+1;
  writeln(total);
  close(input);
  close(output);
end.