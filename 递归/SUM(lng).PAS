function sum(n:longint):longint;
   begin
   if n=1 then sum:=1
          else sum:=n+sum(n-1);
   end;
begin
writeln(sum(5):4);
end.