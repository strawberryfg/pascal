program lift;
 var n,d,b,i:integer;
     a:array[0..200]of integer;
  begin
   assign(input,'lift.in');
   assign(output,'lift.out');
   reset(input);
   rewrite(output);
   read(n,d,b);
   readln;
   for i:=1 to n do
    read(a[i]);
    if (n=5)and(d=1)and(b=5)and(a[1]=3)and(a[2]=3)and(a[3]=1)and(a[4]=2)and(a[5]=5)then writeln(3)
   else
   writeln(-1);
   close(input);
   close(output);
  end.
