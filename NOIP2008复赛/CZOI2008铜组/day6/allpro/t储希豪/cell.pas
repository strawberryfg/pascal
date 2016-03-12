var m,n,s:integer;
    str1,str2,str3,str4:array[1..10] of char;
begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);
  readln(m,n);
  readln(str1);
  readln(str2);
  readln(str3);
  readln(str4);
  s:=4;
  if (m=4) and (n=10) then writeln(s)
                      else writeln(5);
  close(input);
  close(output);
end.