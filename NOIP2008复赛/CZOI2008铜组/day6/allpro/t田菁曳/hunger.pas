var a:array[1..2,1..1500]of integer;
    i,j,n,x,y,total:integer;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    for j:=1 to 2 do
  read(a[j,i]);
  for i:=1 to n-1 do
    for j:=i+1 to n do
    begin
    if ((a[2,i]>=a[1,j])and(a[1,i]<=a[2,j]))
       or((a[2,j]>=a[1,i])and(a[1,j]<=a[2,i]))
       and((a[1,i]<>0)and(a[1,j]<>0)and(a[2,i]<>-1)and(a[2,j]<>-1))
    then begin
           x:=a[2,i]-a[1,i]+1;
           y:=a[2,j]-a[1,j]+1;
           if x<y then begin
                         a[2,i]:=-1;
                         a[1,i]:=0;
                       end
                  else begin
                         a[2,j]:=-1;
                         a[1,j]:=0;
                       end;
         end
         else
     end;
     for i:=1 to n do
        begin
        total:=total+a[2,i]-a[1,i]+1;
        end;
     writeln(total);
  close(input);
  close(output);
end.