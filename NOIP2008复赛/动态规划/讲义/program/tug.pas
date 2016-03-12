program Tug;

const
  maxn=100;
  maxn2=maxn div 2;
  maxrange=450;

var
  c:array [0..maxn2,0..maxn2*maxrange] of boolean;
  a:array [1..maxn] of longint;
  ppp,pp,n,n2,sum,i,j,k,delta,min,mi:longint;

begin
  assign(input,'tug.in');
  assign(output,'tug.out');
  reset(input);
  rewrite(output);

  read(ppp);
  for pp:=1 to ppp do
  begin
    if pp>1 then writeln;
    read(n); n2:=(n+1) div 2;
    sum:=0;
    for i:=1 to n do
    begin
      read(a[i]);
      inc(sum,a[i]);
    end;
    fillchar(c,sizeof(c),0); c[0,0]:=true;
    for k:=1 to n do
    begin
      delta:=a[k];
      for i:=n2-1 downto 0 do
        for j:=maxrange*i downto 0 do
          if c[i,j] then c[i+1,j+delta]:=true;
    end;
    min:=maxlongint; mi:=0;
    for j:=0 to maxrange*n2 do
      if c[n2,j] and (abs(sum-j-j)<min) then
      begin
        min:=abs(sum-j-j);
        if j<=sum div 2 then mi:=j else mi:=sum-j;
      end;
    writeln(mi,' ',sum-mi);
  end;

  close(output);
  close(input);
end.
