var
    i,n:longint;
    s:longint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(n);
  i:=0;
  s:=0;
  while i<n do
  begin
    i:=i+1;
    if (i>0) and (i<=9) then s:=s+1
                         else if (i>9) and (i<=99) then s:=s+2
                                                    else if (i>99) and (i<=999) then s:=s+3
                                                                            else if (i>999) and (i<=9999) then s:=s+4
else if (i>9999) and (i<=99999) then s:=s+5
                           else  if (i>99999) and (i<=999999) then s:=s+6
                                                        else  if (i>999999) and (i<=9999999) then s:=s+7
else if (i>9999999) and (i<=99999999) then s:=s+8
                              else    if i>99999999 then s:=s+8;
end;
  writeln(s);
  close(input);
  close(output);
end.