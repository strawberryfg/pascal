var s:string;
    a:array[1..1000] of longint;
    l,i,total,value,code,j:integer;
begin
    assign(input,'primenum.in');
    reset(input);
    assign(output,'primenum.out');
    rewrite(output);
    l:=length(s);
i:=1;
while value<>0 do
      val(s,value,code);
      value:=value mod 10;
      a[i]:=value;
       inc(i);
value:=value div 10;
for j:=1 to l do
if  a[j] mod 2=0 then total:=total+1;
writeln(total);
close(input);
close(output);
end.
