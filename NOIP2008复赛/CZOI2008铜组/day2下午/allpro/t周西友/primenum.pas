program ex2;
var  n,total,m:longint;
     a:array[1..1000]of longint;
 function prime(n:integer):boolean;
 var  i,j:integer;
 begin
  if (n=1)or(n<=0) then begin prime:=false;exit;end;
  if (n=2)or(n=3) then begin prime:=true;exit;end;
  j:=trunc(sqrt(n));
 for i:=2 to j do if n mod i =0 then begin prime:=false;exit;end
                                else   prime:=true;
 end;

begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  n:=1;
  while not eof do
  begin
   readln(a[n]);
   inc(n);
  end;
  dec(n)
  total:=0;
  for m:=1 to n do
   if prime(a[m])=true then total:=total+1;
  writeln(total);
  close(input);
  close(output);
end.
