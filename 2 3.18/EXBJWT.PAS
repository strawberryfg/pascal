var i,j,k:longint;
begin
for i:=1 to 19 do
begin
     for j:=1 to 33 do
     begin
          k:=100-i-j;
          if (5*i+3*j+k div 3=100)and(k mod 3=0) then writeln(i,' ',j,' ',k);
     end;
end;
end.