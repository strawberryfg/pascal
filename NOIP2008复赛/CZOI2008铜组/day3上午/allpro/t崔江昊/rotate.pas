var d,x,n,i,j:longint; a:array[0..21,0..21] of integer;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
x:=1; a[1,1]:=1;
a[1,n+1]:=-10;
a[n+1,n]:=-10;
a[n,0]:=-10;
i:=1;
j:=1;
while x<n*n do
  begin
  while a[i,j+1]=0 do
     begin
     x:=x+1;
     j:=j+1;
     a[i,j]:=x;
     end;
   while a[i+1,j]=0 do
     begin
     x:=x+1;
     i:=i+1;
     a[i,j]:=x;
     end;
    while a[i,j-1]=0 do
     begin
     x:=x+1;
     j:=j-1;
     a[i,j]:=x;
     end;
     while a[i-1,j]=0 do
     begin
     x:=x+1;
     i:=i-1;
     a[i,j]:=x;
     end;
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