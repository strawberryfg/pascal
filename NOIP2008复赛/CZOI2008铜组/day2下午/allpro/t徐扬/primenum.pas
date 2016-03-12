var
   t1,t,j,i,s,max:integer;
   a:array[0..1001] of integer;
begin
 assign(input,'primenum.in');
 assign(output,'primenum.out');
 reset(input);
 rewrite(output);
 i:=0;max:=0;s:=0;
 while not eof do
     begin
      inc(i);readln(a[i]);if a[i]>max then max:=a[i];
     end;
 t:=2;
 while t<=max div 2+1 do
  begin
   for j:=1 to i do if (a[j] mod t=0) and (a[j]<>t) then begin a[j]:=0;continue;end;
   t:=t+1;
  end;
 for j:=1 to i do
     if a[j]<>0 then s:=s+1;
 writeln(s);
 close(input);
 close(output);
end.

