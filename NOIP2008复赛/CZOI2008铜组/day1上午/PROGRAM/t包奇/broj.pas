program broj;
var s1,s2:string;
    i,j,n:integer;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(n);
  s1:='';s2:='';
  for i:=1 to n do
      begin
        str(i,s1);
        s2:=s2+s1;
      end;
  j:=length(s2);
  writeln(j);
  close(input);
  close(output);
end.