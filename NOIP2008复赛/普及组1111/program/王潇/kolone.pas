Var i,j,n1,n2,t:longint;
    a:array[1..100]of char;
    b:array[1..100,1..2]of longint;
Begin
  assign(input,'kolone.in');
  assign(output,'kolone.out');
  reset(input);rewrite(output);
  readln(n1,n2);
  for i:=n1 downto 1 do
    begin
      read(a[i]);
      b[i,1]:=i;
      b[i,2]:=1;
    end;
  readln;
  for i:=n1+1 to n1+n2 do
    begin
      read(a[i]);
      b[i,1]:=i;
      b[i,2]:=2;
    end;
  readln;
  readln(t);
  close(input);
  for i:=1 to t do
    begin
      j:=0;
      while j<n1+n2 do
        begin
          inc(j);
	  if (b[j,2]=1)and(b[j+1,2]=2) then
             begin
	       b[j,1]:=b[j,1] xor b[j+1,1];
               b[j+1,1]:=b[j,1] xor b[j+1,1];
	       b[j,1]:=b[j,1] xor b[j+1,1];
               b[j,2]:=b[j,2] xor b[j+1,2];
               b[j+1,2]:=b[j,2] xor b[j+1,2];
	       b[j,2]:=b[j,2] xor b[j+1,2];
               inc(j);
	     end;
	end;
    end;
  for i:=1 to n1+n2 do
    write(a[b[i,1]]);
  writeln;
  close(output);
End.
