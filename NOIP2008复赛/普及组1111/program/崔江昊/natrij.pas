var x:string; i,j:longint; a,b,c:array[1..3] of longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(x);
j:=0;
for i:=1 to length(x) do
   begin
   if x[i]<>':' then a[j+1]:=ord(x[i])-48+a[j+1]*10
                else j:=j+1;
   end;
   x:='';
   readln(x);
   j:=0;
   for i:=1 to length(x) do
   begin
   if x[i]<>':' then b[j+1]:=ord(x[i])-48+b[j+1]*10
                else j:=j+1;
   end;
   if (a[1]>b[1]) then begin c[1]:=24-a[1]; a[1]:=0; end;
   if a[3]>b[3] then begin c[3]:=60-a[3]+b[3]; a[2]:=a[2]+1;end
                else c[3]:=b[3]-a[3];
   if a[2]>b[2] then begin c[2]:=60-a[2]+b[2]; a[1]:=a[1]+1; end
                else c[2]:=b[2]-a[2];
   c[1]:=c[1]+b[1]-a[1];
   if c[1]=-1 then c[1]:=23;
   for i:=1 to 3 do
     begin
     if c[i]>9 then write(c[i])
               else write('0',c[i]);
     if i<3 then write(':');
     end;
   close(input);
   close(output);
end.
