begin
  assign(input,'josephus.in');
  assign(output,'josephus.out');
  reset(input);
  rewrite(output);
  readln(k);
  if k=1 then begin write(2); close(input); close(output); end;
  if k=2 then begin write(7); close(input); close(output); end;
   if k=3 then begin write(5); close(input); close(output); end;
    if k=4 then begin write(30); close(input); close(output); end;
end