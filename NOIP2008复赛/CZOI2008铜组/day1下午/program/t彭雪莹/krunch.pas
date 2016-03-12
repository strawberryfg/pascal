var n,i,t,j,k,c:integer;
    s:string;
    a:array[1..30]of integer;
begin
  assign(input,'charcom.in');
  reset(input);
  assign(output,'charcom.out');
  rewrite(output);
  readln(n);
  read(s);
  for i:=1 to length(s) do
  case s[i] of
      'A':a[i]:=1;
      'B':a[i]:=2;
      'C':a[i]:=3;
      'D':a[i]:=4;
      'E':a[i]:=5;
      'F':a[i]:=6;
      'G':a[i]:=7;
      'H':a[i]:=8;
      'I':a[i]:=9;
      'J':a[i]:=10;
      'K':a[i]:=11;
      'L':a[i]:=12;
      'M':a[i]:=13;
      'N':a[i]:=14;
      'O':a[i]:=15;
      'P':a[i]:=16;
      'Q':a[i]:=17;
      'R':a[i]:=18;
      'S':a[i]:=19;
      'T':a[i]:=20;
      'U':a[i]:=21;
      'V':a[i]:=22;
      'W':a[i]:=23;
      'X':a[i]:=24;
      'Y':a[i]:=25;
      'Z':a[i]:=26
      end;
      t:=0;
      for i:=1 to length(s) do
      begin
      if a[i]<>i then
      begin
         for k:=1 to a[i]-i do
           for j:=1 to n-1 do begin t:=t+(n-j); end;
           t:=t+1;
       end
      else inc(t);
      end;
      writeln(t);
  close(input);
  close(output);
end.
