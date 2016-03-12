var c1,c2:set of 'A'..'Z';
    n1,n2,i,n,j,t:longint;
    a,b,c:array[1..30] of char;
    ch:char;
begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
  readln(n1,n2);
  c1:=[];
  c2:=[];
  for i:=1 to n1 do
    begin
      read(ch);
      c1:=c1+[ch];
      c[n1-i+1]:=ch;
    end;
  readln;
  for i:=1 to n2 do
    begin
      read(ch);
      c2:=c2+[ch];
      c[n1+i]:=ch;
    end;
  readln;
  n:=n1+n2;
  readln(t);
  for i:=1 to t do
    begin
      j:=1;
      while j<n do
        if (c[j] in c1) and (c[j+1] in c2) then
          begin
            ch:=c[j];
            c[j]:=c[j+1];
            c[j+1]:=ch;
            j:=j+2;
          end
        else inc(j);
    end;
  for i:=1 to n do write(c[i]);
  writeln;
  close(input);
  close(output);
end.