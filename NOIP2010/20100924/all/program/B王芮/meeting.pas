var n:longint;
    a,b,s:array[1..100000]of longint;
    t:boolean;
    i,j,min:longint;
begin
  assign(input,'meeting.in');
  reset(input);
  assign(output,'meeting.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do read(a[i]);
  readln;
  for i:=1 to n do read(b[i]);
  for i:=1 to n do s[i]:=0;
  min:=maxlongint;
  for i:=1 to n do
    begin
      t:=true;
      for j:=1 to n do
      if j<>i then
        begin
          if not(s[i]>min) then
          s[i]:=s[i]+abs(a[i]-a[j])*b[j]
          else begin t:=false;break; end;
        end;
      if (s[i]<min)and(t=true) then min:=s[i];
    end;
  writeln(min);
  close(input);
  close(output);
end.