var
  n,i,j,min:longint;
  s,num,time:array[1..100000]of longint;
begin
  assign(input,'meeting.in');
  reset(input);
  assign(output,'meeting.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    read(s[i]);
  for i:=1 to n do
    read(num[i]);
  for i:=1 to n do
    begin
      for j:=1 to i-1 do
        time[i]:=time[i]+num[j]*(s[i]-s[j]);
      for j:=i+1 to n do
        time[i]:=time[i]+num[j]*(s[j]-s[i]);
    end;
  min:=maxlongint;
  for i:=1 to n do
    if time[i]<min then min:=time[i];
  writeln(min);
  close(input);
  close(output);
end.