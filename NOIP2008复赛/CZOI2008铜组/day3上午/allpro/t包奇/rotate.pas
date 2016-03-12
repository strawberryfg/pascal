program rotate;
var a:array[1..20,1..20] of integer;
    i,j,k,g,n:integer;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output); 
  readln(n);
  for i:=1 to n+1 do
      for j:=1 to n+1 do
          a[i,j]:=0;
  g:=1;
  k:=1;
  i:=1;
  j:=1;
  while k<=n*n do
      begin
        a[i,j]:=k;
        case g of
           1: if ((j+1)>n)or(a[i,j+1]<>0) then begin inc(i);g:=2 end
                                          else inc(j);
           2: if ((i+1)>n)or(a[i+1,j]<>0) then begin dec(j);g:=3 end
                                          else inc(i);
           3: if ((j-1)<1)or(a[i,j-1]<>0) then begin dec(i);g:=4 end
                                          else dec(j);
           4: if ((i-1)<1)or(a[i-1,j]<>0) then begin inc(j);g:=1 end
                                          else dec(i);
         end;
         inc(k);
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
