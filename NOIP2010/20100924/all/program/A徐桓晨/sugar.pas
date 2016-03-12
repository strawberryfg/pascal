var n,a2,a3:longint;

function try(n:longint):longint;
  var sum:longint;
  begin
  if n=1 then exit(3);
  sum:=try(n-1);
  if a2=1 then begin sum:=sum+try(n-1);a2:=0;end;
  if a3>0 then begin sum:=sum+try(n-1);dec(a3);end;
  if n>2 then sum:=sum+try(n-2);
  if n>5 then sum:=sum+try(n-5);
  try:=sum;
  end;

begin
assign(input,'sugar.in');
assign(output,'sugar.out');
reset(input);
rewrite(output);
readln(n);
a2:=1;
a3:=4;
writeln(try(n));
close(input);close(output);
end.
