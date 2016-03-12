{var year:longint;
begin
read(year);
if year mod 100=0 then if year mod 400=0 then writeln('run')
                                         else writeln('ping')
                  else if year mod 4=0   then writeln('run')
                                         else writeln('ping');
end.}
var year:longint;
begin
writeln('please press a year');read(year);
if (year mod 400=0) or ((year mod 100<>0) and (year mod 4=0)) then writeln('run')
                                                              else writeln('ping');
end.