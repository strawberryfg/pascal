var a:array[1..30] of integer;
     sum,k,n,i,j:integer;
function fib(n:integer):integer;
begin
  if fib >2 then fib(n-1)
            else fib:=1;
end;
begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);
  readln(n);
  readln(k);
  sum:=0;
  for i:=1 to k do
  readln(a[i]);
  for j:= 1 to k do
    while (i<>n) and (i<>a[j]) do
      begin
        i:=i+1;
        sum:=sum+fib(i);
      end;
  writeln(sum);
  close(input);
  close(output);
end.
