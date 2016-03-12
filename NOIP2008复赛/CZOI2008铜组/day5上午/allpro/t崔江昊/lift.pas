var n,b,e,i:longint; a,c:array[1..1000] of longint;
procedure try(cen,dep:longint);
   var i,s:longint;
   begin
   if c[cen]=1 then begin writeln('-1'); close(input); close(output); halt;end;
   c[cen]:=1;
   if cen=b then begin writeln(dep); close(input); close(output); halt;end;
   for i:=1 to n do
      if (i+a[i]=cen) or (i-a[i]=cen)then
      begin
      try(i,dep+1);
      dep:=dep-1;
      end;
   end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,b,e);
   for i:=1 to n do
   read(a[i]);
try(e,1);
close(input);
close(output);
end.