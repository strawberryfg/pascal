var year,month:longint;
begin
read(year,month);
case month of
     1,3,5,7,8,10,12:writeln(31);
     2:if (year mod 400=0) or ((year mod 100<>0) and (year mod 4=0)) then writeln(29)
                                                                     else writeln(28);
     4,6,9,11:writeln(30);
end;
end.