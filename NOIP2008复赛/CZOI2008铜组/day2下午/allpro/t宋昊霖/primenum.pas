program primenum;
 var a:array[0..1000]of integer;
     i,j,s:integer;
  procedure pdss(shuzi:integer);
   var m,n,jilu:integer;
   begin
     jilu:=0;
     if shuzi=1 then jilu:=2
                    else
                     begin
                      for n:=2 to shuzi do
                      if shuzi mod n=0 then
                       begin
                        jilu:=jilu+1;
                       end;
                     end;
     if jilu=1 then s:=s+1;
   end;
  begin
   assign(input,'primenum.in');
   reset(input);
   assign(output,'primenum.out');
   rewrite(output);
   s:=0;
   i:=0;
   while not eof do
    begin
     inc(i);
     readln(a[i]);
    end;
    for j:=1 to i do pdss(a[j]);
   writeln(s);
   close(input);
   close(output);
  end.
