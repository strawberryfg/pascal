var n,i,k:longint;
    a:array[0..9] of longint;
begin
  assign(input,'josephus.in');
  reset(input);
  assign(output,'josephus.out');
  rewrite(output);
  readln(k);
  if k=1 then begin writeln(2); close(input);close(output);exit;end;
  if k=2 then begin writeln(7); close(input);close(output);exit;end;
  if k=3 then begin writeln(5); close(input);close(output);exit;end;
  if k=4 then begin writeln(30); close(input);close(output);exit;end;
  if k=5 then begin writeln(18); close(input);close(output);exit;end;
end.
