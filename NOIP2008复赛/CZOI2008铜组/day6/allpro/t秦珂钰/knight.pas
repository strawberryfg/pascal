program knight(input,output);
const max=10;
      dx:array[1..8] of integer=(1,-1,-2,-2,-1,1,2,2);
      dy:array[1..8] of integer=(2,2,1,-1,-2,-2,-1,1);
var a:array[1..5,1..4] of integer;
    b:array[0..20] of integer;
    k,step,i,j,x,y,m,n,x1,y1,sum:integer;
begin
  assign(input,'knight.in');
  reset(input);
  assign(output,'knight.out');
  rewrite(output);
  readln(n,m,x,y);
  if (m=0) or (n=0) then begin
                           writeln('No Answer!');
                         end;
  for i:=1 to n do
    for j:=1 to m do
      a[i,j]:=0;
  for i:=0 to m*n do
    b[i]:=0;
  k:=0;
  step:=0;
  a[x,y]:=1;
  x1:=x;
  y1:=y;
  while (b[0]=0) and (step<m*n-1) do
  begin
    k:=k+1;
    if k>8 then begin
                  a[x,y]:=0;
                  k:=b[step];
                  x:=x-dx[k];
                  y:=y-dy[k];
                  step:=step-1;
                  if step=0 then begin
                                   writeln('No Answer!');
                                   close(input);
                                   close(output);
                                   exit;
                                 end;
                end
           else begin
                  x:=x+dx[k];
                  y:=y+dy[k];
                  if (x<=0) or (y<=0) or (x>n) or (y>m) or (a[x,y]<>0)
                        then begin
                               x:=x-dx[k];
                               y:=y-dy[k];
                             end
                        else begin
                               step:=step+1;
                               a[x,y]:=step+1;
                               b[step]:=k;
                               k:=0;
                             end;
                end;
  end;
  sum:=0;
  for i:=1 to n do
    for j:=1 to m do
      sum:=sum+a[i,j];
  write('(',x1,',',y1,')->');
  for i:=1 to m*n-1 do
  begin
    x1:=x1+dx[b[i]];
    y1:=y1+dy[b[i]];
    if i<n*m-1 then write('(',x1,',',y1,')->')
               else writeln('(',x1,',',y1,')');
  end;
  close(input);
  close(output);
end.
