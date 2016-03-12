var be,af:longint;
begin
writeln('please press an integer ');
read(be);
af:=af+(be mod 10)*1000;
be:=be div 10;
af:=af+(be mod 10)*100;
be:=be div 10;
af:=af+(be mod 10)*10;
be:=be div 10;
af:=af+(be mod 10);
be:=be div 10;
writeln(af);
end.