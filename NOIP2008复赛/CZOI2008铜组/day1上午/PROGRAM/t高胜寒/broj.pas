var s,n,ii:longint;
    count:int64;
    i,time:shortint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(n);
  s:=n;
  ii:=1;
  while s<>0 do begin s:=s div 10; time:=time+1; end;
  for i:=1 to time-1 do
  begin
    count:=count+9*ii*i;
    ii:=ii*10;
  end;
  count:=count+(n-ii+1)*time;
  writeln(count);
  close(input);
  close(output);
end.