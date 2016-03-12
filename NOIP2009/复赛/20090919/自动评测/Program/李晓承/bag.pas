program asdf;
var
     i,j,n,a,b,c:longint;
begin
     assign(input,'bag.in');reset(input);
     assign(output,'bag.out');rewrite(output);
     readln(n);
     if n=1 then writeln(1)
            else if n=2 then writeln(5)
                 else
     begin
       a:=1;b:=5;
       for i:=3 to n do
        begin
          c:=(a*4+b)mod 997;
          a:=b;b:=c;
        end;
       writeln(c);
     end;
     close(input);close(output);
end.
