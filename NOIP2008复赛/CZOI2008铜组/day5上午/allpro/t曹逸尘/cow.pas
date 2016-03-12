var n,i:longint;
    k:int64;
begin
 assign(input,'cow.in');
  assign(output,'cow.out');
  rewrite(input);
  reset(output);
  readln(n);
  k:=8;
  if n<=3 then writeln(1)
         else if n<=7  then writeln(n-2)
                       else if n=8 then writeln(8)
                                   else if n=9 then writeln(12)
                                     else
                                        begin
                                            for i:= 2 to (n+3)-10+1 do
                                              k:=k+i;
                                              k:=k+n-10;
                                            writeln(k);
                                          end;


  close(input);
  close(output);
end.
