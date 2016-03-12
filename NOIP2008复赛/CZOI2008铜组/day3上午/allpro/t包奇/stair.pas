program stair;
type x=array[1..30] of integer;
var a:x;
    l1,l2,l3,total,i,j,k,n,m:integer;
function djj(a,b,c,m:integer;g:x):boolean;
var  i,j,k,l:integer;
begin
  djj:=true;
  for i:=0 to a do
      for j:=0 to b do
           for k:=0 to c do
                for l:=1 to m do
                     if (g[l]=i*1+j*2+k*3) then begin djj:=false;exit;end;
end;
begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);
  readln(n);
  readln(m);
  for i:=1 to m do
      readln(a[i]);
  l1:=n;
  l2:=n div 2;
  l3:=n div 3;
  total:=0;
  for i:=0 to l1 do
      for j:=0 to l2 do
          for k:=0 to l3 do
                if (1*i+2*j+3*k=n)and(djj(i,j,k,m,a)=true) then inc(total);
   for j:=0 to l2 do
      for i:=0 to l1 do
          for k:=0 to l3 do
                if (1*i+2*j+3*k=n)and(djj(i,j,k,m,a)=true) then inc(total);
  writeln(total);
  close(input);
  close(output);
end.
