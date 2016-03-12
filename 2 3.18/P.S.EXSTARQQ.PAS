var i,n,t,j:longint;
    a:boolean;
begin
read(n);
for i:=1 to 3*n-1{2(n-1)+n+1}do
    begin
    t:=i;
    if i>2*n{n-1+n+1}then t:=3*n-i
                     else
                     if (i>n-1)and(i<2*n+1) then t:=n;
    if t=1 then for j:=1 to 3*n-1 do write('*  ')
           else
           begin
           if (i>n)and(i<2*n){spaceareas}then a:=false
                                         else a:=true;
           for j:=1 to t-1 do
               write('*  ');
           for j:=1 to ((3*n-1)-2*(t-1)) do
               if (j=1)or(j=((3*n-1)-2*(t-1))) then write('*  ')
                                               else
                                               begin
                                               if a=false then write('   ')
                                                          else write('*  ');
                                               end;
           for j:=1 to t-1 do
               write('*  ');
           end;
writeln;
writeln;
end;
end.