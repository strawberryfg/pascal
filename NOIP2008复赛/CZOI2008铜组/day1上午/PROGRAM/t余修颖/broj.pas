var n,s,i,p:longint;
begin
     assign(input,'broj.in');
     reset(input);
     assign(output,'broj.out');
     rewrite(output);

     readln(n);
     s:=0;
     if n div 10=0 then s:=n
                   else begin
                   if n div 100=0 then s:=9+(n-9)*2
                                  else if n div 1000=0 then s:=189+(n-99)*3
                                                       else if n div 10000=0 then s:=2889+(n-999)*4
                                                                             else if n div 100000=0 then s:=38889+(n-9999)*5
                                                                                                    else if n div 1000000=0 then s:=488889+(n-9999)*6
                                                                                                                            else if n div 10000000=0 then s:=5888889+(n-99999)*7


                                                           

                        end;

     writeln(s);

     close(input);
     close(output);
end.