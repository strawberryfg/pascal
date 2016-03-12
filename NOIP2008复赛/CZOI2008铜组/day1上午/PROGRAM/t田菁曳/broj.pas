var n,z,len,t,s,x,y,i:longint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  read(n);
  z:=n;
  t:=0;
  len:=0;
  y:=10;
  while z<>0 do
  begin
  t:=t+1;
  if t>1 then for i:=1 to (t-2) do y:=y*10
         else y:=1;
  s:=z div 10;
    if s>0 then len:=len+t*y*9;
    z:=z div 10;
  end;
  n:=n-y*10+1;
  len:=len+n*t;
  writeln(len);
  close(input);
  close(output);
end.
