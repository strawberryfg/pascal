var a:array[1..1000,1..1000] of longint;
   b:array[1..1000] of longint;
   x,y,i,n,m:longint;
procedure try(dep:longint);
   var i,j,k:longint;
   begin
   for i:=1 to n do
   if (a[dep,i]=1) and (b[i]=0)  then
      begin
      b[i]:=1;
      try(i);
      end;
   end;
begin
assign(input,'message.in');
reset(input);
assign(output,'message.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
  begin
  readln(x,y);
  a[x,y]:=1;
  end;
for i:=1 to n do
   begin
   fillchar(b,sizeof(b),0);
   try(i);
   if b[i]=0 then writeln('F')
             else writeln('T');
   end;
close(input);
close(output);
end.