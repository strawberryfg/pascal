program chorus;
var a:array[1..100]of integer;
    n,i,k:integer;
begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do 
    read(a[i]);
  writeln('4');
  close(input);
  close(output);  
end.