program broj;
var n,i:longint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.in');
  rewrite(output);
  readln(n);
  if (n<10) then i:=n
  else if (n=>10) and (n<100) then i:=(n-9)*2+9
  else if (n=>100) and (n<1000) then i:=(n-99)*3+189
  else if (n=>1000) and (n>10000) then i:=(n-999)*4+2889
  else if (n=>10000) and (n<100000) then i:=(n-9999)*5+38889
  else if (n=>100000) and (n<1000000) then i:=(n-99999)*6+488889
  else if (n=>1000000) and (n<10000000) then i:=(n-999999)*7+5888889
  else if (n=>10000000) then i:=8+68888889;
  writeln('i=');
  close(input);
  close(output);
end.