program lift_new;
{made by pig}
var g:array[1..200,1..200]of integer;
    n,a,b:integer;
procedure seton;
  begin
    assign(input,'lift.in');
    assign(output,'lift.out');
    reset(input);
    rewrite(output);
  end;
procedure setoff;
  begin
    close(input);
    close(output);
  end;
procedure readin;
  var i,j,k:integer;
  begin
    read(n,a,b);
    if a=b then begin write(0);setoff;end;
    for i:=1 to n do
     for j:=1 to n do
      g[i,j]:=maxint;
    for i:=1 to n do
     begin
       read(k);
       if i+k<=n then g[i,i+k]:=1;
       if i-k>0 then g[i,i-k]:=1;
     end;
  end;
procedure writeout;
  begin
    if g[a,b]=maxint then write(-1) else write(g[a,b]);
  end;
procedure floyed;
  var i,j,k:integer;
  begin
    for k:=1 to n do
     for i:=1 to n do
      for j:=1 to n do
       if g[i,k]+g[k,j]<g[i,j] then g[i,j]:=g[i,k]+g[k,j];
  end;
begin
  seton;
  readin;
  floyed;
  writeout;
  setoff;
end.
