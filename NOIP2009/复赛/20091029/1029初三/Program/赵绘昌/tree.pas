var a:array[1..100,-1..100] of longint;
    f:array[1..100] of longint;
    i,j,k,n,m,s,tt:longint;
procedure try(c,dep:longint);
  var i,j,k:longint;
  begin
  if a[dep,0]=0 then begin if c>tt then tt:=c; end
                else for i:=1 to a[dep,0] do
                         begin
                         c:=c+a[a[dep,i],-1];
                         try(c,a[dep,i]);
                         c:=c-a[a[dep,i],-1];
                         end;
  end;
begin
assign(input,'tree.in');
reset(input);
assign(output,'tree.out');
rewrite(output);
read(n);
for i:=1 to n do
    begin
    read(a[i,-1]);
    while not eoln do
          begin
          inc(a[i,0]);
          read(a[i,a[i,0]]);
          end;
    end;
try(a[1,-1],1);
writeln(tt);
close(input);
close(output);
end.
