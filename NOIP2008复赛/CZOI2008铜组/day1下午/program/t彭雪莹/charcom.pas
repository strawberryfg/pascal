var i,j,l,n:longint;
    p,sum:int64;
    s:string;
begin
  assign(input,'charcom.in');
  reset(input);
  assign(output,'charcom.out');
  rewrite(output);
  readln(n);
  read(s);
  j:=1;
  sum:=1;
  while j<n do
  begin
  l:=n-ord(s[j])+ord('A')-3;
  p:=1;
  for i:=1 to l do p:=p*2;
  inc(sum);
  for i:=1 to ord(s[j])-ord('A') do
   begin
   sum:=sum+p;
   p:=p*2;
   end;
   dec(n);
   inc(j);
  end;
  writeln(sum);
  close(input);
  close(output);
end.