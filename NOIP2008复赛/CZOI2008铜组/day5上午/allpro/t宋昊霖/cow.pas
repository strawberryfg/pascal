program cow;
 var s:int64;
     i,n:integer;
     a:array[0..200]of int64;
  begin
   assign(input,'cow.in');
   reset(input);
   assign(output,'cow.out');
   rewrite(output);
   readln(n);
   if n<4 then writeln(1);
   for i:=1 to 3 do
    a[i]:=0;
    a[4]:=1;
    s:=2;

     for i:=5 to n do
      begin
       a[i]:=a[i-1]+a[i-3];
       s:=s+a[i];
      end;
     writeln(s);
   close(input);
   close(output);
  end.
