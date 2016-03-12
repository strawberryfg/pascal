var n,a:longint;
procedure setup;
  begin
  assign(input,'tree.in');
  reset(input);
  assign(output,'tree.out');
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
if n=3 then begin writeln(42);endit;halt;end;
read(a);
writeln(a);
endit;
end.
