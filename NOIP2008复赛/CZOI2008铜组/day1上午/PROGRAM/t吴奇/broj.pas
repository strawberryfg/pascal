program broj;
var n,sum,i:longint;
begin
     assign(input,'broj.in');reset(input);
     assign(output,'broj.out');rewrite(output);
     readln(n);
     sum:=0;
     for i:=7 downto 0 do
            begin
                 if n div power(10,i)=0 then continue
                                        else begin
                                                  sum:=sum+(i+1)*(n-power(10,i)+1);
                                                  n:=power(10,i)-1;
                                             end;
            end;
     writeln(sum);
     close(input);
     close(output);
end.