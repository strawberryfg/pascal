var
   n,i,j,k,ans,f:longint;
   a,c:array[1..1000000] of longint;
begin
  assign(input,'seq.in');reset(input);
  assign(output,'seq.out');rewrite(output);
  readln(n);
  for i:=1 to n do readln(c[i]);
  f:=0;
  j:=c[1]+1;
  ans:=0;
  while f=0 do
    begin
      dec(j);
      a[1]:=j;
      a[2]:=c[1]*2-j;
      for k:=3 to n+1 do
        begin
          a[k]:=c[k-1]*2-a[k-1];
          if a[k]<a[k-1] then begin f:=1;break; end;
        end;
      if f=0 then inc(ans);
    end;
  writeln(ans);
  close(input);close(output);
end.
