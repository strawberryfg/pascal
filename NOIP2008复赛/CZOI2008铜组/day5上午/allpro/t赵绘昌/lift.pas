var a,b:array[1..200] of longint;
    now,n,aa,bb,i,j,k:longint;
procedure endd(c:longint);
  begin
  writeln(c);
  close(input);
  close(output);
  halt;
  end;
procedure try(x:longint);
  var i,j,s:longint;
  begin
  if x=bb then endd(now)
          else for i:=1 to 2 do
               begin
               s:=-1;
               if i=1 then if x+a[x]<=n then begin x:=x+a[x]; s:=1; end
                      else if x-a[x]>=1 then begin x:=x-a[x]; s:=1; end;
               if s=-1 then endd(s);
               inc(now);
               try(x);
               end;
  end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,aa,bb);
for i:=1 to n do
    read(a[i]);
now:=0;
try(aa);
end.
