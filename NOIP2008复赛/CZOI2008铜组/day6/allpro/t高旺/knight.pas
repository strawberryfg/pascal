var a1,b1,n,m:longint;
    a,b:array[1..100] of longint;
    pd:array[1..10,1..10] of longint;
    
procedure printout;
var i:longint;
begin
  write('(',a1,',',b1,')','->');
  for i:=1 to m*n-2 do
    write('(',a[i],',',b[i],')','->');
  writeln('(',a[m*n-1],',',b[m*n-1],')');
  close(input);
  close(output);
  halt;
end;

procedure gwtry(a1,b1,dep:longint);
var x,y:longint;
begin
  if dep=m*n then printout
             else begin
                     x:=a1+2;
                     y:=b1+1;
                     if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                                            begin
                                                                              pd[x,y]:=1;
                                                                              a[dep]:=x;
                                                                              b[dep]:=y;
                                                                              gwtry(x,y,dep+1);
                                                                              a[dep]:=0;
                                                                              b[dep]:=0;
                                                                              pd[x,y]:=0;
                                                                            end;
                     x:=a1+1;
                     y:=b1+2;
                     if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                                            begin
                                                                              pd[x,y]:=1;
                                                                              a[dep]:=x;
                                                                              b[dep]:=y;
                                                                              gwtry(x,y,dep+1);
                                                                              a[dep]:=0;
                                                                              b[dep]:=0;
                                                                              pd[x,y]:=0;
                                                                            end;
x:=a1-2;
y:=b1+1;
if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                   begin
                                                   pd[x,y]:=1;
                                                   a[dep]:=x;
                                                     b[dep]:=y;
                                                     gwtry(x,y,dep+1);
                                                     a[dep]:=0;
                                                     b[dep]:=0;
                                                     pd[x,y]:=0;
                                                   end;
x:=a1-1;
y:=b1-2;
if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                   begin
                                                   pd[x,y]:=1;
                                                   a[dep]:=x;
                                                     b[dep]:=y;
                                                     gwtry(x,y,dep+1);
                                                     a[dep]:=0;
                                                     b[dep]:=0;
                                                     pd[x,y]:=0;
                                                   end;
x:=a1-2;
y:=b1-1;
if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                   begin
                                                   pd[x,y]:=1;
                                                   a[dep]:=x;
                                                     b[dep]:=y;
                                                     gwtry(x,y,dep+1);
                                                     a[dep]:=0;
                                                     b[dep]:=0;
                                                     pd[x,y]:=0;
                                                   end;
x:=a1-1;
y:=b1+2;
if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                   begin
                                                   pd[x,y]:=1;
                                                   a[dep]:=x;
                                                     b[dep]:=y;
                                                     gwtry(x,y,dep+1);
                                                     a[dep]:=0;
                                                     b[dep]:=0;
                                                     pd[x,y]:=0;
                                                   end;
x:=a1+1;
y:=b1-2;
if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                   begin
                                                   pd[x,y]:=1;
                                                   a[dep]:=x;
                                                     b[dep]:=y;
                                                     gwtry(x,y,dep+1);
                                                     a[dep]:=0;
                                                     b[dep]:=0;
                                                     pd[x,y]:=0;
                                                   end;
x:=a1+2;
y:=b1-1;
if (x>=1)and(x<=m)and(y>=1)and(y<=n)and(pd[x,y]=0) then
                                                   begin
                                                   pd[x,y]:=1;
                                                   a[dep]:=x;
                                                     b[dep]:=y;
                                                     gwtry(x,y,dep+1);
                                                     a[dep]:=0;
                                                     b[dep]:=0;
                                                     pd[x,y]:=0;
                                                   end;
           end;
end;
begin
  assign(input,'knight.in'); reset(input);
  assign(output,'knight.out'); rewrite(output);
  readln(m,n,a1,b1);
  pd[a1,b1]:=1;
  gwtry(a1,b1,1);
  writeln('No Answer!');
  close(input); close(output);
end.