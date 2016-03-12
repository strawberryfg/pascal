var a:array[0..200,1..2] of integer;
    i,sum,j,n:integer;
begin
   readln(n);
   fillchar(a,sizeof(a),0);
   a[1,1]:=1;
   a[0,1]:=1;
   for j:=1 to n do
   for i:=1 to n do
   begin
   a[i,2]:=a[i,2]+1;
   if (a[i,2]>=4) and (a[i,1]<>0) then a[i,1]:=a[i,1]+1;
   end;
   sum:=0;
   for i:=1 to n do
   sum:=sum+a[i,1];
   writeln(sum);
   end.
