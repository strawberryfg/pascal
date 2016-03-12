var a:array[0..21,0..21]of longint;
    i,j,l,n,k:longint;
begin
  assign(input,'rotate.in');
  assign(output,'rotate.out');
  reset(input);
  rewrite(output);
  readln(n);
  l:=1;
  for i:= 0 to 21 do
      for j:=0 to 21 do a[i,j]:=0;
  for k:=1 to n*n do
    for i:=1 to n do
      for j:=1 to n do  begin
    if l=1  then if (j<=n)and (a[i,j]=0)then begin a[i,j]:=j;inc(j);end
                         else l:=2;
    if l=2  then if (i<=n)and (a[i,j]=0)then begin a[i,j]:=i;inc(i);end
                         else l:=3;
    if l=3  then if (j<=n)and (a[i,j]=0)then begin a[i,j]:=j;dec(j);end
                         else l:=4;
    if l=4  then if  (i<=n)and (a[i,j]=0)then begin a[i,j]:=i;dec(i);end
                         else l:=1;
    end;
    for i:=1 to n do
      for j:=1 to n do
          write(a[i,j]:4);
  close(input);
  close(output);
end.
