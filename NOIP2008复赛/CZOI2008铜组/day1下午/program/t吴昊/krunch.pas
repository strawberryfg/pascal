var s1,st:string;
    a:array[1..70] of string;
    b:array[1..100] of longint;
    i,j,len:longint;
    pp:boolean;
procedure cc(s:string);
var ls,j:longint;
    b:string;
begin
  b:='';
  ls:=length(s);
  for j:=1 to ls do
    if (s[j]<>'A') and (s[j]<>'E') and (s[j]<>'I') and (s[j]<>'O') and (s[j]<>'U') then
       b:=b+s[j];
  a[i]:=b;
end;
procedure cf(s:string);
var ls,j,k:longint;
    b:string;
begin
  b:='';
  ls:=length(s);
  for j:=1 to ls-1 do
    for k:=1 to ls do
      if (j<>k) and (s[j]=s[k])  then s[k]:='{';
  a[i]:=s;
  for j:=1 to length(a[i]) do
    if a[i,j]<>'{' then b:=b+a[i,j];
  a[i]:=b;
end;
procedure cft(s:string);
var ls,i,j:longint;
    b:string;
begin
  b:='';
  ls:=length(s);
  for i:=1  to ls-1 do
    for j:=1 to ls do
      if (i<>j) and (s[i]=s[j]) and (s[i]<>' ') then s[j]:='{';
  for i:=1 to ls do
    if s[i]<>'{' then b:=b+s[i];
  st:=b;
end;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  readln(s1);
  i:=1;
  j:=1;
  len:=length(s1);
  while i<=len do
    begin
      while s1[i]<>' ' do
        begin
          a[j]:=a[j]+s1[i];
          inc(i);
          if i>len then break;
        end;
      inc(j);
      inc(i);
    end;
  for i:=1 to j do
    cc(a[i]);
  for i:=1 to j do
    cf(a[i]);
  for i:=1 to j do
    st:=st+a[i]+' ';
  cft(st);
  writeln(st);
  close(input);
  close(output);
end.
