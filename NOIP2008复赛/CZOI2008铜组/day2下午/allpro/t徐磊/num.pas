var a:array[1..1000,1..3] of integer;
    i,j,n,sum:integer;
begin
  assign(input,'num.in');reset(input);
  assign(output,'num.out');rewrite(output);
  fillchar(a,sizeof(a),0);
  readln(n);
  for i:=1 to n do
    readln(a[i,1]);
  for i:=1 to n do
    for j:=1 to i-1 do
      if a[j,1]>a[i,1] then inc(a[i,2]);
  for i:=1 to n do
    for j:=n downto i+1 do
      if a[j,1]>a[i,1] then inc(a[i,3]);
  sum:=0;
  for i:=1 to n do
    if a[i,2]=a[i,3] then inc(sum);
  writeln(sum);
  close(input);
  close(output);
end.
