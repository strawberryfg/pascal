var x,y:array [0..1005] of longint;
    l,r:array [0..1000005] of longint;
    i,j,k,sum,n,ans:longint;

procedure qsort(p,q:longint);
var i,j,mid1,mid2,c:longint;
begin
  i:=p;j:=q;
  mid1:=l[(i+j) div 2];mid2:=r[(i+j) div 2];
  repeat
    while (l[i]<mid1) or ((l[i]=mid1) and (r[i]<mid2)) do inc(i);
    while (l[j]>mid1) or ((l[j]=mid1) and (r[j]>mid2)) do dec(j);
    if j>=i then
      begin
        c:=l[i];l[i]:=l[j];l[j]:=c;
        c:=r[i];r[i]:=r[j];r[j]:=c;
        inc(i);dec(j);
      end;
  until i>j;
  if j>p then qsort(p,j);
  if i<q then qsort(i,q);
end;

begin
  assign(input,'rotsym.in');
  assign(output,'rotsym.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do read(x[i],y[i]);
  for i:=1 to n-1 do
    for j:=i+1 to n do
      begin
        inc(k);
        l[k]:=x[i]+x[j];
        r[k]:=y[i]+y[j];
      end;
  qsort(1,k);
  ans:=0;j:=1;i:=1;
  while i<=k do
  begin
    j:=i;
    while (l[i]=l[j+1]) and (r[i]=r[j+1]) and (j<k) do inc(j);
    ans:=ans+(j-i+1)*(j-i) div 2;
    i:=j+1;
  end;
  writeln(ans);
  close(input);
  close(output);
end. 


 

 

 

 


