var s:integer;
    i,j,n,kk,kkk:longint;
    a:array[-32768..32767]of longint;
begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);
  readln(n,kk);
  for i:=1 to n do
  begin
    readln(s);
    inc(a[s]);
  end;
  i:=32767;
  while a[i]=0 do i:=i-1;
  for j:=i downto -32768 do
  begin
    kkk:=kkk+a[j];
    if kkk>=kk then begin writeln(j); break; end;
  end;
  close(input);
  close(output);
end.
