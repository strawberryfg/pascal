var a:array[1..10000] of boolean;
    i,j,n,sum:longint;
begin
  assign(input,'primenum.in');reset(input);
  assign(output,'primenum.out');rewrite(output);
  fillchar(a,sizeof(a),true);
  a[1]:=false;
  for i:=1 to 10000 do
    if a[i] then
      for j:=2 to 10000 div i do
        a[i*j]:=false;
  while not(eof) do
  begin
    readln(n);
    if a[n] then inc(sum);
  end;
  writeln(sum);
  close(input);
  close(output);
end. 
