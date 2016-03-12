var i,min,k,p,j:longint;
    a,b:array[1..10000]of longint;
    f:boolean;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=0;
min:=1000000;
while not eof do
  begin
   inc(i);
   readln(a[i]);
   if a[i]<min then min:=a[i];
  end;
j:=1;
p:=0;
while j<=min do
 begin
   f:=true;
   for k:=1 to i do
     if a[k] mod j <>0 then begin f:=false;break;end;
   if f=true then begin inc(p);b[p]:=j;end;
   inc(j);
 end;
writeln(b[p]);
close(input);
close(output);
end.