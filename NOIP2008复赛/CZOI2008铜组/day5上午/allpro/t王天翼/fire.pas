var n,i,j,k:longint;
    a:array[1..100,1..100] of char;
begin
  assign(input,'fire.in');
  reset(input);
  assign(output,'fire.out');
  rewrite(output);
  readln(n);
  writeln(k*2-1);
  close(input);
  close(output);
end.
