var a:array[0..21,0..21]of integer;
    fx,i,j,h,l,n:integer;

procedure way;
begin
  if fx=0 then begin inc(l);if (l>n)or(a[h,l]<>0) then begin dec(l);inc(fx);end;end;
  if fx=1 then begin inc(h);if (h>n)or(a[h,l]<>0) then begin dec(h);inc(fx);end;end;
  if fx=2 then begin dec(l);if (l=0)or(a[h,l]<>0) then begin inc(l);inc(fx);end;end;
  if fx=3 then begin dec(h);if (h=0)or(a[h,l]<>0) then begin inc(h);fx:=0;inc(l);end;end;
end;

begin
  assign(input,'rotate.in');reset(input);
  assign(output,'rotate.out');rewrite(output);
  readln(n);
  h:=1;l:=1;fx:=0;
  for i:=1 to n*n do
  begin
    a[h,l]:=i;
    way;
  end;
  for i:=1 to n do
  begin
    for j:=1 to n do
      write(a[i,j]:4);
    writeln;
  end;
  close(input);
  close(output);
end.
