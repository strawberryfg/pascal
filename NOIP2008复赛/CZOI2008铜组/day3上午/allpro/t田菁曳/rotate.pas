var a:array[1..20,1..20]of integer;
    i,j,k,n,s:integer;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=0;
  i:=1;
  j:=1;
  s:=n div 2;
  for k:=1 to n*n do
  begin
  if (j<=i)or (i+1=j)   then  begin   if (i<s)or (j<i) then
                                                     begin
                                                     if i<=(j-i) then begin
                                                                        a[i,j]:=k;
                                                                        inc(i);
                                                                      end
                                                                 else begin
                                                                        a[i,j]:=k;
                                                                        inc(j);
                                                                      end;
                                                                      end
                                               else begin
                                           if j>(n-i+2) then begin
                                                               a[i,j]:=k;
                                                               dec(i);
                                                             end
                                                        else begin
                                                               a[i,j]:=k;
                                                               dec(j);
                                                             end;
                                                       end;
                                                                  end
                                    else begin
                                           if j>(n-i+2) then begin
                                                               a[i,j]:=k;
                                                               dec(i);
                                                             end
                                                        else begin
                                                               a[i,j]:=k;
                                                               dec(j);
                                                             end;
                                         end;


  end;
  for i:=1 to n do
    for j:=1 to n do
      write(a[i,j]:4);
  close(input);
  close(output);
end.
