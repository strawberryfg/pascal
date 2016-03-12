var
   str,max,min:string;
   st:array[1..257] of string;
   i,j,s:integer;
   l:array[1..257] of integer;
begin
  assign(input,'mystring.in');
  assign(output,'mystring.out');
  reset(input);
  rewrite(output);

  while not eoln do
   begin
    inc(i);readln(st[i]);l[i]:=length(st[i]);
   end;
  max:=st[1];
  min:=st[1];
  for j:=1 to i do
      begin
      if l[j]>l[length(max)] then max:=st[j];
      if l[j]<l[length(min)] then min:=st[j];
      end;
  writeln(max);
  writeln(min);
  close(input);
  close(output);
end.