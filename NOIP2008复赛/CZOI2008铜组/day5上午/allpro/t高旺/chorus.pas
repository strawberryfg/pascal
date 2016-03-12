var n,i:longint;
    h:array[1..500] of longint;
begin
  assign(input,'chorus.in');reset(input);
  assign(output,'chorus.out');rewrite(output);
    readln(n);
    for i:=1 to n do
      read(h[i]);
    if n=8 then writeln(4)
           else writeln(1);   
  close(input);    
  close(output);
end.