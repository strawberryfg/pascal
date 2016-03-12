program maxnum;
 var i,j,m,n,t,t1:integer;
     a:array[0..1000]of integer;

  begin
   assign(input,'maxnum.in');
   reset(input);
   assign(output,'maxnum.out');
   rewrite(output);
   i:=0;
   while not eof do
    begin
     inc(i);
     readln(a[i]);
    end;
    t:=a[1];
    t1:=0;
     for j:=2 to i do if a[i]<t then t:=a[i];
      for m:=1 to t do
       begin
        for n:=1 to j do
         begin
          if a[n] mod m<>0 then
           begin
            t1:=1;
            break;
           end;
         end;
        if t1=0 then t:=m
                else t1:=0;
       end;
   writeln(t);
   close(input);
   close(output);
  end.
