Var i,j,m,n,k:longint;
    a:array[1..100]of longint;
    b:array[1..50000000]of boolean;
Begin
  assign(input,'panda.in');reset(input);
  assign(output,'panda.out');rewrite(output);
  readln(n,k);
  for i:=1 to n do begin read(a[i]);b[a[i]]:=true;end;
  for i:=1 to 50000000 do
    if b[i] then
       begin
	 inc(m);
         if m=k then begin writeln(i);close(output);halt;end;
         for j:=1 to n do
           b[i*a[j]]:=true;
       end;
End.
