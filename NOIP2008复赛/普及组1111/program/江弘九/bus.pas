var i,h,j,n,d:longint;
    a:array[1..10000] of char;
begin
  assign(input,'bus.in');
  reset(input);
  assign(output,'bus.out');
  rewrite(output);
  readln(n,d);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n do
    if a[i]='H' then h:=h+1 else j:=j+1;
  if not(abs(h-j)>d) or (h=0) or (j=0) then begin
                                              writeln(1);
                                              close(input);
                                              close(output);
                                              exit;
                                            end;
  writeln(2);
  close(input);
  close(output);
end.
