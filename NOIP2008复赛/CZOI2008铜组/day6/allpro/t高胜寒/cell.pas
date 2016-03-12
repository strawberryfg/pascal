var m,n,i,count:longint;
    a:array[1..60,1..60]of integer;
    s:array[1..60]of string;
procedure sou(line,list,dep:integer);
begin
  if (line>m)or(line=0)or(list>n)or(list=0) then exit;
  if (ord(s[line][list])<>48) then begin
  if (a[line,list]=0) then
  begin
    a[line,list]:=count;
    sou(line+1,list,dep+1);
    sou(line-1,list,dep+1);
    sou(line,list+1,dep+1);
    sou(line,list-1,dep+1);
    if dep=1 then begin inc(count);
       if list<n then sou(line,list+1,1) else sou(line+1,1,1);end;
  end end;
  if dep=1 then if list<n then sou(line,list+1,1) else sou(line+1,1,1);
end;
begin
  assign(input,'cell.in'); reset(input);
  assign(output,'cell.out'); rewrite(output);
  readln(m,n);
  for i:=1 to m do
      readln(s[i]);
  count:=1;
  sou(1,1,1);
  writeln(count-1);
  close(input);
  close(output);
end.
