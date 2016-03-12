program broj;
 var n,d,b,i,s:integer;
     a:array[1..10000]of longint;
  begin
   assign(input,'broj.in');
   reset(input);
   assign(output,'broj.out');
   rewrite(output);
   readln(n);
   d:=10;
   i:=0;
   repeat
    i:=i+1;
     if i mod d=0 then s:=s+b
                      else begin
                            d:=d*10;
                            s:=s+b+1;
                            b:=b+1;
                            end;
   until i=n;
   writeln(s);
   close(input);
   close(output);
  end.

