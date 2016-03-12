const max=10;
      dx:array[1..8]of integer=(1,2,2,1,-1,-2,-2,-1);
      dy:array[1..8]of integer=(-2,-1,1,2,2,1,-1,-2);
var m,n,x,y,x1,y1,step,k,i,j,sum,s:integer;
    a:array[1..max,1..max]of integer;
    b:array[0..max*max]of integer;
begin
  assign(input,'knight.in');
  reset(input);
  assign(output,'knight.out');
  rewrite(output);
  readln(n,m,x,y);
  step:=0; k:=0;
  for i:=0 to m*n do b[i]:=0;
  for x1:=1 to m do
    for y1:=1 to n do a[x1,y1]:=0;
  a[x,y]:=1;
  while (b[0]=0)and(step<m*n-1) do
  begin
    inc(k);
    if k>8 then begin
      a[x,y]:=0;
      k:=b[step];
      dec(step);
      x:=x-dx[k]; y:=y-dy[k];
    end
    else begin
      x:=x+dx[k]; y:=y+dy[k];
      if (x<1)or(x>n)or(y<1)or(y>n)or(a[x,y]>0) then
      begin
        x:=x-dx[k]; y:=y-dy[k];
      end
    else begin
      inc(step);
      a[x,y]:=step+1;
      b[step]:=k;
      k:=0;
    end
    end;
  end;
  sum:=0; s:=0;
  for y1:=1 to n do
    for x1:=1 to m do
    sum:=sum+a[x1,y1];
  if sum<>((m*n*m*n+m*n)div 2) then writeln('No Answer!')
  else begin
  while s<m*n do
  begin
    inc(s);
    for y1:=1 to n do
    begin
      for x1:=1 to m do if (a[x1,y1]=s)and(s<m*n) then write('(',x1,',',y1,')->')
    end;
  end;
  for i:=1 to m do
    for j:=1 to n do if a[i,j]=m*n then writeln('(',i,',',j,')');
  end;
  close(input); close(output);
end.
