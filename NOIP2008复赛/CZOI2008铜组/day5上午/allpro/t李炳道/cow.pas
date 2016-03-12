var a:array[1..201] of longint;
    i,t,s,n:longint;
begin
 assign(input,'cow.in');
 assign(output,'cow.out');
 reset(input);
 rewrite(output);
 readln(n);
 if n<4 then begin
              writeln(n);
              close(input);
              close(output);
              halt;
             end
        else if n<7 then begin
                          writeln(n-2);
                          close(input);
                          close(output);
                          halt;
                         end
 else if n>=8 then begin
                    t:=6;
                    s:=0;
                    for i:=3 to n-5 do
                     s:=s+i;
                   end;
 writeln(s+t);
 close(input);
 close(output);
end.