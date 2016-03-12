var n,d,i,j,aa,bb:longint;
    a,b,f:array[0..2501] of longint;
    s:ansistring;
    ch:char;
begin
  assign(input,'bus.in');
  reset(input);
  assign(output,'bus.out');
  rewrite(output);
  readln(n,d);
  s:='';
  while not(eoln) do
    begin
      read(ch);
      s:=s+ch;
    end;
  readln;
  a[0]:=0;
  b[0]:=0;
  for i:=1 to length(s) do
    if s[i]='H' then begin a[i]:=a[i-1]+1; b[i]:=b[i-1]; end
                else begin b[i]:=b[i-1]+1; a[i]:=a[i-1]; end;
  f[1]:=1;
  for i:=2 to n do
    begin
      f[i]:=f[i-1]+1;
      for j:=1 to i-1 do
        begin
          aa:=a[i]-a[j];
          bb:=b[i]-b[j];
          if s[j]='H' then inc(aa) else inc(bb);
          if (abs(aa-bb)<=d) or (aa=0) or (bb=0) then
            if f[j-1]+1<f[i] then f[i]:=f[j-1]+1;
        end;
    end;
  writeln(f[n]);
  close(input);
  close(output);
end.
