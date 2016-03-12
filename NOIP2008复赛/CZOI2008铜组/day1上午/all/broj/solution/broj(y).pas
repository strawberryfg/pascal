program broj;
var
  n,sum,len,m:longint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);

  readln(n);
  sum:=0;
  len:=1;
  m:=10;
  while n>=m do
  begin
    sum:=sum+9*(m div 10)*len;
    m:=m*10;
    inc(len);
  end;
  sum:=sum+len*(n-(m div 10)+1);
  writeln(sum);

  close(input);
  close(output);
end.