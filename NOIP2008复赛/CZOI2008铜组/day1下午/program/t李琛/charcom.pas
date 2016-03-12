var b:array[0..26] of longint;
     m,j,i,s,n:integer;
     k:string;
begin
  assign(input,'charcom.in');
  reset(input);
  assign(output,'charcom.out');
  reset(output);
  m:=2;
  s:=0;
  readln(n);
  readln(k);
  fillchar(b,26,1);
  for i:= 1 to n-length(k) do
  begin
  s:=s+m;
  m:=m*2;
  end;
writeln(s);
close(input);
close(output);
end.
