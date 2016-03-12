var i,j,n,ans:longint;
    a:array[1..4,1..100] of boolean;

procedure search(x,y:longint);
begin
  if (x=4) and (y=n) then begin inc(ans); exit; end;
  if a[x,y] then begin
  if a[x,y+1] and a[x,y] and (y<=n-1) then
    begin
      a[x,y]:=false;
      a[x,y+1]:=false;
      if y<=n-1 then search(x,y+1) else search(x+1,1);
      a[x,y]:=true;
      a[x,y+1]:=true;
    end;
  if (x<=3) and a[x+1,y] and a[x,y] then
    begin
      a[x,y]:=false;
      a[x+1,y]:=false;
      if y<=n-1 then search(x,y+1) else search(x+1,1);
      a[x,y]:=true;
      a[x+1,y]:=true;
    end;
    end
    else begin  if y<=n-1 then search(x,y+1) else search(x+1,1);
    end;
    end;


begin
  assign(input,'bag.in');
  assign(output,'bag.out');
  reset(input);
  rewrite(output);
  readln(n);
  ans:=0;
  for i:=1 to 4 do
    for j:=1 to n do a[i,j]:=true;
  search(1,1);
  writeln(ans);
  close(input);
  close(output);
end.
