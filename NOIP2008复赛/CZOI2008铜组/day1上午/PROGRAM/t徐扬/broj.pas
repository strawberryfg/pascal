var    s,i,j,n:longint;
begin
  assign(input,'broj.in');
  assign(output,'broj.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do
     begin
      if i<=9 then s:=s+1
      else
        begin
         j:=i;
         while j>0 do
           begin
            s:=s+1;
            j:=j div 10;
           end;
       end;
    end;
  writeln(s);
 close(input);
 close(output);
end.
