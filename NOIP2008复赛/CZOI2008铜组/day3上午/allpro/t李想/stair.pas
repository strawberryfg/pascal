var n,i,k,s:longint;
    a:array[0..9] of longint;
begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);
  readln(n);
  readln(k);
  s:=1;
  for i:=1 to k do
      readln(a[i]);
  if k=0 then begin for i:=1 to n-1 do s:=s+i;
                    writeln(s);end
         else writeln(n-1);
  close(input);
  close(output);
end.
