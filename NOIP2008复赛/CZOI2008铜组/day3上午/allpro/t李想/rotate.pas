var n,p,i,j,k:longint;
    a:array[0..21,0..21] of longint;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);  
  readln(n);
  a[1,n+1]:=1;
  a[n+1,n]:=1;
  a[n,0]:=1;
  j:=1;k:=1;
  p:=1;
  for i:=1 to n*n do
      begin
      if (p=1)and(a[j,k]=0) then begin a[j,k]:=i;inc(k);end
                            else if (p=1)and(a[j,k]<>0) then begin inc(p);dec(k);inc(j);end;
      if (p=2)and(a[j,k]=0) then begin a[j,k]:=i;inc(j);end
                            else if (p=2)and(a[j,k]<>0) then begin inc(p);dec(j);dec(k);end;
      if (p=3)and(a[j,k]=0) then begin a[j,k]:=i;dec(k);end
                            else if (p=3)and(a[j,k]<>0) then begin inc(p);inc(k);dec(j);end;
      if (p=4)and(a[j,k]=0) then begin a[j,k]:=i;dec(j);end
                            else if (p=4)and(a[j,k]<>0) then begin p:=1;inc(j);inc(k);a[j,k]:=i;inc(k);end;
      end;
  for i:=1 to n do
      begin
      for j:=1 to n do write(a[i,j]:4);
      writeln;
      end;
  close(input);
  close(output);
end.
