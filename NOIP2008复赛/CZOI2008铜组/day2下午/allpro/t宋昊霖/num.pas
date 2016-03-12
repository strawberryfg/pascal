program num;
 var s,n,i:integer;
     a:array[0..1000]of integer;
  procedure panduan(shuzi:integer);
   var jilu1,jilu2,j:integer;
    begin
     jilu1:=0;
     jilu2:=0;
     if i=n then
      begin
       for j:=1 to n do
        if a[j]>a[n] then break
                     else
                     if j=n then s:=s+1;
      end
     else
       begin
            for j:=1 to n-1 do
             if j=i then break
              else if a[j]>shuzi then jilu1:=jilu1+1;
            for j:=n downto i+1 do
                     begin
                      if a[j]>shuzi then jilu2:=jilu2+1;

                     end;
            if jilu1=jilu2 then s:=s+1;
       end;
    end;
  begin
   assign(input,'num.in');
   reset(input);
   assign(output,'num.out');
   rewrite(output);
   readln(n);
   s:=0;
   for i:=1 to n do readln(a[i]);
   for i:=1 to n do panduan(a[i]);
   writeln(s);
   close(input);
   close(output);
  end.
