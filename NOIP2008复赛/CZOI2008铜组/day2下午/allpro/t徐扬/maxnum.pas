var
  i,j,min,t:longint;
  a:array[0..1001] of integer;
begin
 assign(input,'maxnum.in');
 reset(input);
 assign(output,'maxnum.out');
 rewrite(output);
  i:=0;min:=1001;
  while not eof do
   begin
    inc(i);
    readln(a[i]);
    if a[i]<min then min:=a[i];
   end;
       while (min>0) and (t<>0) do
         begin
          t:=0;
          for j:=1 to i do if a[j] mod min<>0 then begin t:=1; break;end;
          if t=1 then min:=min-1;
         end;
    writeln(min);
 close(input);
 close(output);
end.
