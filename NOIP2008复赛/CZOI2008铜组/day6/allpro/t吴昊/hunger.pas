var i,j,n,t,k,s:longint;
    a:array[1..1000,1..3] of integer;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i,1],a[i,2]);
      a[i,3]:=a[i,2]-a[i,1]+1;
    end;
  for i:=1 to n-1 do
    for j:=i+1 to  n do
      if a[j,1]<a[i,1] then
          begin
            t:=a[i,1];
            a[i,1]:=a[j,1];
            a[j,1]:=t;
            t:=a[i,2];
            a[i,2]:=a[j,2];
            a[j,2]:=t;
            t:=a[i,3];
            a[i,3]:=a[j,3];
            a[j,3]:=t;
          end;
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[j,1]<=a[i,2] then
        if a[i,3]<a[j,3] then for k:=1 to 3 do a[i,k]:=0 else for k:=1 to 3 do a[j,k]:=0;
  s:=0;
  for i:=1 to n do
    s:=s+a[i,3];
  writeln(s);
  close(input);
  close(output);
end.