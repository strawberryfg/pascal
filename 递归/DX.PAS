var s:longint;
procedure dx(n:longint);
   begin
   s:=n mod 10;
   write(s);
   n:=n div 10;
   if n<>0 then dx(n);
   end;
begin
dx(457);
end.