var n:integer;
    st:string;
    i,s:longint;
begin
 assign(input,'charcom.in');
 assign(output,'charcom.out');
 reset(input);
 rewrite(output);
 readln(n);
 readln(st);
 for i:=1 to n-1 do
   s:=s+i*2;
  s:=s+1;
 if length(st)=n then writeln(n);

 close(input);
 close(output);
end.
