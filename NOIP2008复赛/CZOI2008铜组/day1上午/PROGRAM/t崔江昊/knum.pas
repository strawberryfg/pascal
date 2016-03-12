var i,n,p,x,max,min:longint; a:array [-32768..32767] of integer;
begin
readln(n,p);
readln(x);
a[x]:=a[x]+1;
max:=x;
min:=x;
for i:=2 to n do
   begin
   readln(x);
   a[x]:=a[x]+1;
   if x>max then max:=x;
   if x<min then min:=x;
   end;
for i:=max downto min do
   begin
   if a[i]>0 then p:=p-a[i];
   if p<=0 then begin
                writeln(i);
                close(input);
                close(output);
                halt;
                end;
   end;
end.