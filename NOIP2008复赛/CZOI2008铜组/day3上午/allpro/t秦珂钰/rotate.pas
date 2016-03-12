program rotate(input,output);
var a:array[1..4,1..4] of integer;
    i,j,total,n,s1,s2,x1,x2:integer;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=0;
  total:=1;
  i:=1;
  j:=1;
  a[i,j]:=total;
  s1:=1;
  s2:=n;
  x1:=1;
  x2:=n;
  while total<=n*n do
  begin
    total:=total+1;
    if (i=s1) and (j<x2) then begin
                                inc(j);
                                a[i,j]:=total;
                              end
                         else if (i=s1) and (j=x2) then begin
                                                          inc(i);
                                                          a[i,j]:=total;
                                                          inc(s1);
                                                        end
                                                    else if (i=s2) and (j=x2) then begin
                                                                                     dec(j);
                                                                                     a[i,j]:=total;
                                                                                     dec(x2);
                                                                                   end
                                                                              else if (i=s2) and (j>x1) then begin
                                                                                                               dec(j);
                                                                                                               a[i,j]:=total;
                                                                                                              end
                                                                                                        else if (i=s2) and (j=x1) then begin
                                                                                                                                         dec(i);
                                                                                                                                         a[i,j]:=total;
                                                                                                                                         dec(s2);
                                                                                                                                       end
                                                                                                                                  else if (i>s1) and (j=x1) then begin
                                                                                                                                                                   dec(i);
                                                                                                                                                                   a[i,j]:=total;
                                                                                                                                                                   inc(x1);
                                                                                                                                                                 end;
  end;
  for i:=1 to n do
  begin
   for  j:=1 to n do
     write(a[i,j]:4);
   writeln;
  end;
  close(input);
  close(output);
end.
