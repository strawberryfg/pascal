var a,b,c,e:longint;
begin
writeln('please enter a and b');
read(a,b);
c:=a div b;
e:=a mod b;
writeln(a,'/',b,'=',c,'......',e);
writeln(a:25);
writeln('/',b:24);
writeln('---------------------------');
writeln(c:25);
writeln('......',e:19);
end.