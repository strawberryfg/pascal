var a:array[0..100002] of longint;
    ans,i,j,m,n,k,l,r,num,min:longint;
begin
assign(input,'highway.in');
reset(input);
assign(output,'highway.out');
rewrite(output);

  readln(n,m,i);
  for j:=1 to n do
    a[j]:=i;
  ans:=0;
  for i:=1 to m do
    begin readln(num,l,r,k);
          if num=1
          then begin min:=maxlongint;
                     for j:=l to r do if a[j]<min then min:=a[j];
                     if min>0
                     then begin inc(ans);
                                for j:=l to r do a[j]:=a[j]-k;
                          end;
               end;
          if num=2
          then begin for j:=l to r do if a[j]>0 then a[j]:=a[j]+k;
               end;
          if num=3
          then begin for j:=l to r do
                       if (a[j]>0) and (a[j]<k) then a[j]:=k
               end;
    end;
  writeln(ans);

close(input);
close(output);
end.
