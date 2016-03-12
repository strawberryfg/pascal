var a:array[1..1000,0..1000] of integer;
    f:array[1..1000] of boolean;
    i,j,k,n,m,p,c,x,y:longint;
procedure try(k:longint);
  var i,j:longint;
  begin
  if f[p] then begin writeln('T'); c:=0; exit; end
          else begin
               for i:=1 to a[k,0] do
                   if f[a[k,i]]=false then begin f[a[k,i]]:=true; try(a[k,i]); end;
               end;
  end;
begin
assign(input,'message.in');
reset(input);
assign(output,'message.out');
rewrite(output);
read(n,m);
for i:=1 to m do
    begin
    read(x,y);
    inc(a[x,0]);
    a[x,a[x,0]]:=y;
    end;
for i:=1 to n do
    begin
    c:=1;
    for j:=1 to n do
        f[j]:=false;
    f[i]:=false;
    p:=i;
    try(i);
    if c=1 then writeln('F');
    end;
close(input);
close(output);
end.
