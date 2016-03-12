{
ID:xiaweiy1
PROB:fracdec
LANG:PASCAL
}
var
  n,d,i,j,g,k:longint;
  f,x:array[1..100000]of longint;
begin
  assign(input,'fracdec.in');reset(input);
  assign(output,'fracdec.out');rewrite(output);
  readln(n,d);
  k:=n div d;
  write(k,'.');
  while k>=10 do
    begin
      inc(g);//记录多出来的字符，为换行做准备。
      k:=k mod 10;
    end;
  g:=g+2;
  if n mod d=0
  then begin
         writeln(0);
         halt;
       end;
  while n<>0 do
    begin
      inc(i);
      if f[n mod d]=0
      then f[n mod d]:=i
      else begin
             for j:=1 to f[n mod d]-1 do
               begin
                 write(x[j]);
                 if (j+g) mod 76=0
                 then writeln;
               end;
             write('(');inc(g);
             for  j:=f[n mod d] to i-1 do
               begin
                 write(x[j]);
                 if (j+g) mod 76=0
                 then writeln;
               end;
             writeln(')');
             halt;
           end;
      n:=(n mod d)*10;
      x[i]:=n div d;
    end;
  for j:=1 to i-1 do
    write(x[j]);
  writeln;
  close(input);close(output);
end.
