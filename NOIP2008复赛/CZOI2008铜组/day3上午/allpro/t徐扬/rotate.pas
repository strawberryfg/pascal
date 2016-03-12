var a:array[0..21, 0..21] of longint;
    k,t,i,j,n:longint;
begin
  assign(input,'rotate.in');
  assign(output,'rotate.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=0 to n+1 do
      begin
       a[0,i]:=-1;
       a[i,0]:=-1;
       a[n+1,i]:=-1;
       a[i,n+1]:=-1;
      end;
  k:=0;t:=1;i:=1;j:=0;
  while k<n*n do
    begin
     k:=k+1;
     if t=1 then begin if a[i,j+1]=0 then begin a[i,j+1]:=k;j:=j+1 end
       else begin t:=2;a[i+1,j]:=k;i:=i+1;end;end
     else
         if t=2 then begin if a[i+1,j]=0 then begin a[i+1,j]:=k;i:=i+1 end
       else begin t:=3;a[i,j-1]:=k;j:=j-1;end;end
     else
         if t=3 then begin if a[i,j-1]=0 then begin a[i,j-1]:=k;j:=j-1 end
       else begin t:=4;a[i-1,j]:=k;i:=i-1;end;end
     else
         if t=4 then begin if a[i-1,j]=0 then begin a[i-1,j]:=k;i:=i-1 end
       else begin t:=1;a[i,j+1]:=k;j:=j+1;end;end
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
