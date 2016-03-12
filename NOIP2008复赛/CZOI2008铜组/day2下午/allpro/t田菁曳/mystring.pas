var a:array[1..1000]of char;
    b:array[1..1000]of integer;
    c:array[1..1000]of string;
    n,i,j,k:integer;
    t:string;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  n:=0;
  while not eof do
  begin
    inc(n);
    readln(a[n]);
  end;
  for j:=1 to n do
  b[j]:=0;
  j:=1;
  for i:=1 to n do
  if (ord(a[i])<123) then begin b[j]:=b[j]+1;c[j]:=c[j]+a[i]; end
                      else j:=j+1;
  for i:=1 to j-1 do
    for k:=i+1 to j do
      if b[i]>b[k] then begin t:=c[k];
                              c[k]:=c[i];
                              c[i]:=t;
                         end;
  writeln(c[1],c[j]);
  close(input);
  close(output);
end.