var a:array[1..2,1..1000]of longint;
    f:array[1..1000,1..1000]of longint;
    p:array[0..1000,0..1000,1..2]of longint;
    i,j,k,w,n:longint;

function max(a,b:longint):longint;
 begin
  if a>b then exit(a) else exit(b);
 end;

function pin(x,l,flag:longint):longint;
 var tt,i:longint;
  begin
   tt:=0;
   for i:=x+1 to l-1 do
    inc(tt,a[flag,i]);
   pin:=tt*tt;
  end;

procedure conduct;
 var tt,i,j,flag,x,l:longint;
  begin
   fillchar(p,sizeof(p),0);
   for i:=0 to n+1 do
    for j:=i+2 to n+1 do
     for flag:=1 to 2 do
     p[i,j,flag]:=pin(i,j,flag);
  end;

procedure dp;
 var i,j,x,y,ii,jj,u,o,ans:longint;
  begin
   for i:=1 to n do
    for j:=i to n do
     begin
     for ii:=1 to i-1 do
      for jj:=1 to j-1 do
      f[i,j]:=max(f[i,j],f[ii,jj]-p[ii,i,1]-p[jj,j,2]+a[1,i]*a[2,j]);
     end;


   for i:=1 to n do
    for j:=1 to n do
     f[i,j]:=f[i,j]-p[i,n+1,1]-p[j,n+1,2];

   ans:=0;
   for i:=1 to n do
    for j:=1 to n do
     ans:=max(ans,f[i,j]);
   writeln(ans);

  for i:=1 to n do
  begin
   for j:=1 to n do
    write(f[i,j],' ');
   writeln;
   end;
  end;
begin
 assign(input,'concert.in');
 assign(output,'concert.out');
 reset(input);
 rewrite(output);

 readln(n);
 for i:=1 to n do readln(a[1,i]);
 for i:=1 to n do readln(a[2,i]);
 fillchar(f,sizeof(f),0);
 conduct;
 for i:=1 to n do
  for j:=1 to n do
  f[i,j]:=a[1,i]*a[2,j]-p[0,i,1]-p[0,j,2];

 dp;

 close(input);
 close(output);
end.
