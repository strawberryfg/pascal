procedure hano(n:longint;y,z,m:char);
   begin
   if n=1 then write(y,'-->',m,'   ')
          else begin
               hano(n-1,y,m,z);
               write(y,'-->',m,'   ');
               hano(n-1,z,y,m);
               end;
   end;
begin
hano(3,'A','B','C');
end.