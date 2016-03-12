var a:array[0..9] of longint;
    n,i,k:longint;
begin
  assign(input,'count.in');reset(input);
  assign(output,'count.out');rewrite(output);
  for i:=0 to 9 do a[i]:=0;
  readln(n);
  for i:=1 to n do
    begin
      k:=i;
      while k<>0 do
        begin
          a[k mod 10]:=a[k mod 10]+1;
          k:=k div 10;
        end;
    end;
  for i:=0 to 9 do
    writeln(a[i]);
  close(input);
  close(output);
end.
