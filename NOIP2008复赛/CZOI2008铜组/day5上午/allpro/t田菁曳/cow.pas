var n,i:integer;
    t1,t2,t3,t4:int64;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  readln(n);
  t1:=1;
  t2:=0;
  t3:=0;
  t4:=0;
  for i:=1 to (n-1) do
  begin
  t4:=t3+t4;
  t3:=t2;
  t2:=t1;
  t1:=t4;
  end;
  writeln(t1+t2+t3+t4);
  close(input);
  close(output);
end.