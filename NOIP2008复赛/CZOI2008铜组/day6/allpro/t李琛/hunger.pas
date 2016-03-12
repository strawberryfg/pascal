var a:array[1..2000,1..3] of integer;
    t,i,j,b,start:integer;
begin
   assign(input,'hunger.in');
   reset(input);
   assign(output,'hunger.out');
   rewrite(output);
   readln(b);
   for i:=1 to b do
     for j:=1 to 2 do
     read(a[i,j]);
   for i:=1 to b do
     a[i,3]:=a[i,1]+a[i,2];
   for i:=1 to b do
     for j:=i to b do
       if (a[i,1]=a[j,2]) or (a[i,2]=a[j,1]) then a[i,3]:=a[i,3]+a[j,3];
   for i:=1 to b do
     for j:=i to b do
       if a[i,3]<a[j,3] then  begin
                                t:=a[i,3];
                                a[i,3]:=a[j,3];
                                a[j,3]:=t;
                              end;
  writeln(a[1,3]+a[2,3]);
  close(input);
  close(output);
end.
