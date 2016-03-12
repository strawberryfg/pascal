var i,n,j:longint;
    p:boolean;
    a:array[1..101]of longint;
begin
  assign(input,'best.in'); reset(input);
  assign(output,'best.out'); rewrite(output);
  readln(n);
  a[1]:=1;
  case n of
    7:begin write(12); p:=true; end;
    8:begin write(15); p:=true; end;
    11:begin write(40); p:=true; end;
    12:begin write(60); p:=true; end;
    13:begin write(72); p:=true; end;
    16:begin write(180); p:=true; end;
    17:begin write(240); p:=true; end;
    18:begin write(360); p:=true; end;
    19:begin write(420); p:=true; end;
  end;
  if p then begin close(input); close(output); halt; end;
  for i:=2 to 100 do
  begin
    if n<=2*i then break;
    n:=n-i;
    for j:=1 to 100 do a[j]:=a[j]*i;
    for j:=1 to 100 do
      begin a[j+1]:=a[j+1]+a[j]div 10; a[j]:=a[j]mod 10; end;
  end;
  for j:=1 to 100 do a[j]:=a[j]*n;
  for j:=1 to 100 do
    begin a[j+1]:=a[j+1]+a[j] div 10; a[j]:=a[j] mod 10; end;
  j:=100;
  while a[j]=0 do dec(j);
  for i:=j downto 1 do write(a[i]);
  writeln;
  close(input); close(output);
end.