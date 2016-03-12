var n,i,j:longint;
    a:array[1..100000]of longint;
    s,min:qword;
    b:array[1..100000]of qword;
begin
  assign(input,'meeting.in');
  assign(output,'meeting.out');
  reset(input);
  rewrite(output);
  min:=999999999999999;
  readln(n);
  for i:=1 to n do
      read(a[i]);
  for i:=1 to n do
      read(b[i]);
  for i:=1 to n do
      begin
        s:=0;
        for j:=1 to n do
            s:=s+b[j]*(abs(a[i]-a[j]));
        if s<min then min:=s;
      end;
  writeln(min);
  close(input);
  close(output);
end.