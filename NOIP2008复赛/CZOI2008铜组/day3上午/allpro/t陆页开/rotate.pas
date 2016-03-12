var a:array[1..20,1..20] of integer;
    i,j,t,f,n:integer;
procedure setup;
  begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(n);
f:=1;
i:=1;
j:=1;
t:=1;
while t<=n*n do
      begin
      a[i,j]:=t;
      case f of
           1:if ((j+1)>n)or(a[i,j+1]<>0) then begin i:=i+1;f:=2 end
                                         else j:=j+1;
           2:if ((i+1)>n)or(a[i+1,j]<>0) then begin j:=j-1;f:=3 end
                                         else i:=i+1;
           3:if ((j-1)<1)or(a[i,j-1]<>0) then begin i:=i-1;f:=4 end
                                         else j:=j-1;
           4:if ((i-1)<1)or(a[i-1,j]<>0) then begin j:=j+1;f:=1 end
                                         else i:=i-1;
      end;
      inc(t);
      end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
        writeln;
    end;
endit;
end.
