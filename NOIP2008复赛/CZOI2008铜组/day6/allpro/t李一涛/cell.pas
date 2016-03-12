var a:array[1..60,1..60]of integer;
    b:array[1..60,1..60]of boolean;
    c:array[1..60]of string;
    m,n,i,j,k,s:integer;
    pa,pb:boolean;
begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);
  readln(m,n); s:=0; pa:=false; pb:=false;
  fillchar(b,sizeof(b),true);fillchar(a,sizeof(a),0);
  for i:=1 to m do readln(c[i]);
  for i:=1 to m do
  begin
    for j:=1 to length(c[i]) do a[i,j]:=ord(c[i][j])-ord('0');
  end;
  for i:=1 to m do
    for j:=1 to n do
  if (a[i,j]<>0)and(a[i,j+1]<>0)and(b[i,j]=true)and(b[i,j+1]=true) then
  begin
    for k:=1 to n do if a[i,k]=0 then begin pa:=true; break; end;
    for k:=1 to n do if a[i+1,k]=0 then begin pb:=true; break; end;
    if pa and pb then begin inc(s); b[i,j]:=false; b[i,j+1]:=false; end;
  end;
  writeln(s div 2);
  close(input); close(output);
end.
