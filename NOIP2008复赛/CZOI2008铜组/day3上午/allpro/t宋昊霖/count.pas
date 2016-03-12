program count;
 var i,n,j,jilu:longint;
     a:array[0..9]of longint;
  begin
   assign(input,'count.in');
   reset(input);
   assign(output,'count.out');
   rewrite(output);
   readln(n);
   for i:=0 to 9 do
    begin
     a[i]:=0;
    end;
   for i:=1 to n do
    begin
     jilu:=i;
     while jilu<>0 do
      begin
      j:=jilu mod 10;
      a[j]:=a[j]+1;
      jilu:=jilu div 10;
      end;
    end;
   for i:=0 to 9 do writeln(a[i]);
   close(input);
   close(output)
  end.