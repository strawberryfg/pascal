var i,j,x,k,y:integer;
    s,n,m:string;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  readln(s);
  x:=length(s);
  for i:=1 to x do
  if (s[i]='A')or(s[i]='E')or(s[i]='I')or(s[i]='O')or(s[i]='U') then s[i]:='1';
  n:=' ';
  k:=0;
  for i:=1 to x do
    if s[i]<>'1' then begin  inc(k); n[k]:=s[i]; end;
  for i:=1 to k do
    if n[i]<>' ' then begin
                        for j:=i+1 to k do
                           if (n[i]=n[j])  then n[j]:='1';
    end;
  m:=' ';
  y:=0;
  for i:=1 to k do
    if n[i]<>'1' then begin  inc(y); m[y]:=n[i]; end;
  for i:=1 to y-1 do
    if m[i]=m[i+1] then m[i]:='1';
  if m[1]=' ' then m[1]:='1';
  if m[y]=' ' then m[y]:='1';
  for i:=1 to y do
    if (m[i]=',')or(m[i]='.')or(m[i]='?') then if m[i-1]=' ' then m[i-1]:='1';
  for i:=1 to y do
    if m[i]<>'1' then write(m[i]);
  close(input);
  close(output);
end.
