program count;
var a:array[0..9] of integer;
    i,k,m,n:integer;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  readln(n);
  for i:=0 to 9 do
      a[i]:=0;
  for i:=1 to n do
      begin
        m:=i;
        while (m<>0) do
          begin 
            k:=m mod 10;
            inc(a[k]);
            m:=m div 10;
          end; 
      end;
  for i:=0 to 9 do
      writeln(a[i]);    
  close(input);
  close(output);
end.