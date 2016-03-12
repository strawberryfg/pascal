var n,i,j,k,m:longint;
    a:array[0..1000001] of longint;
    b,c:array[0..30] of longint;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  fillchar(b,sizeof(b),0);
  readln(n);
  for i:=0 to 9 do
    c[i]:=i;
  for i:=1 to n do
    a[i]:=i;
  for i:=1 to n do
    begin
      if a[i]>=10 then repeat
                        m:=a[i] mod 10;
                        for j:=0 to 9 do
                          if m=c[j] then inc(b[j]);
                        a[i]:=a[i] div 10;
                      until a[i]<10;
      for k:=0 to 9 do
        if a[i]=c[k] then inc(b[k]);
    end;
  for i:=0 to 9 do
    writeln(b[i]);
  close(input);
  close(output);
end.
