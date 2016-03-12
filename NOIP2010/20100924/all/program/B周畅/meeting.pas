var
  n,i,j:longint;
  s,min:int64;
  a,b:array[1..100000]of int64;
begin
  assign(input,'meeting.in'); reset(input);
  assign(output,'meeting.out');rewrite(output);
  readln(n);
  for i:=1 to n do read(a[i]);
  readln;
  for i:=1 to n do read(b[i]);
  readln;
  min:=9223372036854775807;
  for i:=1 to n do
    begin
      s:=0;
      for j:=1 to n do
        if j<>i then s:=s+b[j]*(abs(a[i]-a[j]));
      if s<min then min:=s;
    end;
  writeln(min);
  close(input); close(output);
end.