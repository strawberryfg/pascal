var n,t,x,i,s:longint; a:array[1..40] of boolean;
procedure try(dep:longint);
   var i:longint;
   begin
   if dep<=n then
   if dep=n then s:=s+1
            else for i:=1 to n do
                 begin
                 if a[dep+i] =false then begin try(dep+i); end;
                 end;
   end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(x);
fillchar(a,sizeof(a),false);
for i:=1 to x do
   begin
   readln(t);
   a[t]:=true;
   end;
s:=0;
try(0);
writeln(s);
close(input);
close(output);
end.
