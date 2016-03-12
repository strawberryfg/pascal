var i,j,n,count:longint;
    a:array[1..20,1..20]of longint;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n);
  if n=1 then begin writeln(1:4); close(input); close(output); exit; end;
  count:=1;
  for i:=1 to n-1 do
  begin
    for j:=i to n+1-i do
    begin
      a[i,j]:=count;
      inc(count);
    end;
    for j:=i+1 to n+1-i do
    begin
      a[j,n+1-i]:=count;
      inc(count);
    end;
    for j:=n-i downto i do
    begin
      a[n+1-i,j]:=count;
      inc(count);
    end;
    for j:=n-i downto i+1 do
    begin
      a[j,i]:=count;
      inc(count);
    end;
  end;
  for i:=1 to n do
  begin
    for j:=1 to n do
        write(a[i,j]:4);
    writeln;
  end;
  close(input);
  close(output);
end.