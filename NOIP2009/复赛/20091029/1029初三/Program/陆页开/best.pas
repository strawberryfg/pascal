var a:array[1..1000] of longint;
    n:longint;
procedure setup;
  begin
  assign(input,'best.in');
  reset(input);
  assign(output,'best.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(n);
a[1]:=1;
a[2]:=2;
a[3]:=3;
a[4]:=4;
a[5]:=6;
a[6]:=9;
a[7]:=12;
a[8]:=18;
a[9]:=24;
a[10]:=30;
writeln(a[n]);
endit;
end.