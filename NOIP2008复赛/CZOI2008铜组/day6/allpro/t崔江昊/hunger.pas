var a,d,b,s:array[1..1000] of longint; max,i,j,n:longint;
function pd:boolean;
   var i:longint;
   begin
   for i:=a[j] to b[j] do
    begin
    if d[i]=1 then begin pd :=false; exit;end;
    end;
    pd:=true;
    for i:=a[j] to b[j] do
    d[i]:=1;
   end;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do
   begin
   read(a[i],b[i]);
   end;
for i:=1 to n do
   begin
   fillchar(d,sizeof(d),0);
   for j:=a[i] to b[i] do
   d[j]:=1;
   s[i]:=b[i]-a[i]+1;
   for j:=1 to n do
         if i<>j then
         if pd=true then s[i]:=s[i]+b[j]-a[j]+1;
   end;
   max:=s[1];
for i:=2 to n do
   if s[i]>max then max :=s[i];
   writeln(max);
   close(input);
   close(output);
end.