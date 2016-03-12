var sum,s,i:longint;
        a:array[1..1000]of longint;

function pd(n:longint):boolean;
  var i:longint;
  begin
  if n=1 then begin pd:=false;exit;end;
  pd:=true;
  for i:=2 to trunc(sqrt(n)) do
        if n mod i=0 then begin pd:=false;break;end;
  end;

begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
s:=0;
while not eof do
        begin
        inc(s);
        readln(a[s]);
        end;
sum:=0;
for i:=1 to s do
        if pd(a[i]) then inc(sum);
writeln(sum);
close(input);
close(output);
end.