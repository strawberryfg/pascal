var i,p,t,s:longint;
    a,least:real;
begin
  assign(input,'car.in'); reset(input);
  assign(output,'car.out'); rewrite(output);
  readln(s,t); least:=maxlongint;
  for i:=1 to 4 do
  begin
    a:=0; p:=(s-1) div (i*10);
    a:=p*t/60;
    case i of
      1:a:=a+s/100;
      2:a:=a+s/90;
      3:a:=a+s/80;
      4:a:=a+s/75;
    end;
    if a<least then least:=a;
  end;
  if s/70<least then least:=s;
  writeln(least:0:2);
  close(input); close(output);
end.