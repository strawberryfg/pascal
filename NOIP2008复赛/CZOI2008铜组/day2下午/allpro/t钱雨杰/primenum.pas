var i,n,q,total,number:longint;
    a:array[1..1000]of longint;
procedure try(n,q:longint);
  var b:boolean;
  begin
  b:=true;
  if (n=1)or((n mod 2=0)and(n<>2)) then b:=false 
  else for i:=2 to trunc(sqrt(n)) do
             if n mod i= 0 then begin b:=false;break;end;
  if b=true then inc(total);
  if q<number then try(a[q+1],q+1);
  end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
i:=0;
total:=0;
while not eof do
  begin
  inc(i);
  readln(a[i]);
  end;
number:=i;
try(a[1],1);
writeln(total);
close(input);
close(output);
end.
