var a:array[0..11,0..11]of integer;
    n,i,j,s,m:integer;
    ch:char;
begin
  assign(input,'fire.in');
  reset(input);
  assign(output,'fire.out');
  rewrite(output);
  read(n); fillchar(a,sizeof(a),0); s:=0;
  for i:=1 to n do
  begin
    readln;
    for j:=1 to n do
    begin
      read(ch);
      if ch='X' then a[i,j]:=1;
    end;
  end;
  for i:=1 to n do
  begin
    for j:=1 to n do write(a[i,j]);
    writeln;
  end;
  for i:=1 to n do
    for j:=1 to n do
  begin
    if (a[i,j]=1)and(a[i-1,j]=0)and(a[i,j+1]=0)and(a[i,j-1]=0)and(a[i+1,j]=0)
    then inc(s);
  end;
  writeln(n+s);
  close(input); close(output);
end.