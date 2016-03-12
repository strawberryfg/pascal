var i,n,a,k,ans:longint;
    b:array [0..100] of longint;

procedure qsort(l,r:longint);
var i,j,temp,mid:longint;
begin
  i:=l;
  j:=r;
  mid:=b[(i+j) div 2];
  repeat
    while b[i]<mid do inc(i);
    while b[j]>mid do dec(j);
    if i<=j then begin
                   temp:=b[i];
                   b[i]:=b[j];
                   b[j]:=temp;
                   inc(i);
                   dec(j);
                 end;
  until i>j;
  if i<r then qsort(i,r);
  if j>l then qsort(l,j);
end;

procedure search(now,t:longint);
var tot,x,i:longint;
begin
  if now=k then begin
                  ans:=t;
                  exit;
                end;
  x:=now;
  tot:=0;
  while x<>0 do
    begin
      tot:=tot+x mod 10;
      x:=x div 10;
    end;
  i:=0;
  x:=now;
  while x<>0 do
    begin
      inc(i);
      b[i]:=x mod 10;
      x:=x div 10;
    end;
  qsort(1,i);
  tot:=tot*b[i];
  tot:=tot+b[1];
  search(tot,t+1);
end;

begin
  assign(input,'express.in');
  assign(output,'express.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a);
      readln(k);
      ans:=0;
      search(a,0);
      writeln(ans);
    end;
  close(input);
  close(output);
end.
