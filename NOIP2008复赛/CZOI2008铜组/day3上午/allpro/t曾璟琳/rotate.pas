var k,n,i,j,l:longint;
    a:array[0..401,0..401]of longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
for i:=0 to n+1 do
 for j:=0 to n+1 do
    a[i,j]:=0;
l:=1;
a[1,1]:=1;
i:=1;
j:=1;
for k:=2 to n*n do
  begin
   if l=1 then begin inc(j);
                     if (j>n)or (a[i,j]<>0) then begin dec(j);inc(i);a[i,j]:=k;l:=2;continue;end;
               end;
   if l=2 then begin inc(i);
                     if (i>n) or (a[i,j]<>0)then begin dec(i);dec(j);a[i,j]:=k;l:=3;continue;end;
               end;
   if l=3 then begin dec(j);
                     if (j<1) or (a[i,j]<>0)then begin inc(j);dec(i);a[i,j]:=k;l:=4;continue;end;
               end;
   if l=4 then begin dec(i);
                     if (i<1) or (a[i,j]<>0)then begin inc(i);inc(j);a[i,j]:=k;l:=1;continue;end;
               end;
   a[i,j]:=k;
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