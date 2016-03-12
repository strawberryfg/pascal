var i,n:longint;
    s:int64;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  read(n); s:=0; close(input);
  if n>9 then s:=s+9 else begin s:=s+n; writeln(s); close(output); halt; end;
  if n>99 then s:=s+90*2 else begin s:=s+2*(n-10); writeln(s); close(output); halt; end;
  if n>999 then s:=s+900*3  else begin s:=s+3*(n-100); writeln(s); close(output); halt; end;
  if n>9999 then s:=s+9000*4  else begin s:=s+4*(n-1000); writeln(s); close(output); halt; end;
  if n>99999 then s:=s+90000*5  else begin s:=s+5*(n-10000); writeln(s); close(output); halt; end;
  if n>999999 then s:=s+900000*6  else begin s:=s+6*(n-100000); writeln(s); close(output); halt; end;
  if n>9999999 then s:=s+9000000*7  else begin s:=s+7*(n-1000000); writeln(s); close(output); halt; end;
  if n>99999999 then s:=s+90000000*8  else begin s:=s+8*(n-10000000); writeln(s); close(output); halt; end;
  if n>999999999 then s:=s+900000000*9  else begin s:=s+9*(n-100000000); writeln(s); close(output); halt; end;
end.

