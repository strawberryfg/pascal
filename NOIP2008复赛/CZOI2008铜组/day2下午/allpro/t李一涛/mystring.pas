var a:array[1..250]of string;
    s:char;
    i,j,x,y,k:integer;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  i:=1;
  fillchar(a,sizeof(a),0);
  while not eoln do
  begin
    read(s);
    if s<>' ' then a[i]:=a[i]+s
              else inc(i);
  end;
  x:=length(a[1]); y:=x;
  for j:=2 to i do
  begin
    k:=length(a[j]);
    if k>x then x:=k;
    if k<y then y:=k;
  end;
  for j:=1 to i+1 do
  begin
    if length(a[j])=x then begin writeln(a[j]); break; end;
  end;
  for j:=1 to i+1 do
  begin
    if length(a[j])=y then begin writeln(a[j]); break; end;
  end;
  close(input);
  close(output);
end.
