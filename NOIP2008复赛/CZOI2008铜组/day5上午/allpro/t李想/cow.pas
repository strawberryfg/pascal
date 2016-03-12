var i,n,s:longint;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
readln(n);
if n<4 then s:=1
       else if n<7 then s:=n-2
                   else begin
                        s:=1;
                        for i:=2 to n-6 do
                            s:=s+i;
                        s:=s+n-2;
                        end;
writeln(s);
close(input);
close(output);
end.
