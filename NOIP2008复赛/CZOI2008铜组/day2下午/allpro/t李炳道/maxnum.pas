var a,b,c,r,k:integer;
begin
 assign(input,'maxnum.in');
 reset(input);
 assign(output,'maxnum.out');
 rewrite(output);

 readln(a,b,c);
 k:=a*b;
 while b<>0 do
  begin
   r:=a mod b;
   a:=b;
   b:=r;
  end;
 k:=a*c;
 while c<>0 do
  begin
   r:=a mod c;
   a:=c;
   c:=r;
  end;
 writeln(a);

 close(input);
 close(output);
end.
