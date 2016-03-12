program kth(input,output);

const
  inf='kth.in';
  outf='kth.out';
  maxq=20;
  maxn=100000;

type
  tdata=array [0..maxq,1..maxn] of longint;

var
  data:tdata;
  n,m:longint;

procedure setup;
begin
  assign(input,inf);
  reset(input);
  assign(output,outf);
  rewrite(output);
end;

procedure endit;
begin
  close(input);
  close(output);
end;

procedure init;
var
  i:longint;
begin
  read(n,m);
  for i:=1 to n do read(data[0][i]);
end;

procedure sort(l,r,dep:longint);
var
  m,i,j,s:longint;
begin
  if l=r then
    begin
      data[dep][l]:=data[0][l];
      exit;
    end;
  m:=(l+r) div 2;
  sort(l,m,dep+1);
  sort(m+1,r,dep+1);
  i:=l;
  j:=m+1;
  s:=l-1;
  while (i<=m) and (j<=r) do
    if data[dep+1][i]<data[dep+1][j] then
      begin
        inc(s);
        data[dep][s]:=data[dep+1][i];
        inc(i);
      end else
      begin
        inc(s);
        data[dep][s]:=data[dep+1][j];
        inc(j);
      end;
  if i>m then
    while j<=r do
      begin
        inc(s);
        data[dep][s]:=data[dep+1][j];
        inc(j);
      end else
      while i<=m do
        begin
          inc(s);
          data[dep][s]:=data[dep+1][i];
          inc(i);
        end;
end;

function getss(dep,l,r,p:longint):longint;
var
  li,ri,mi:longint;
begin
  li:=l;
  ri:=r;
  while li<ri do
    begin
      mi:=(li+ri) div 2;
      if data[dep][mi]=p then
        begin
          getss:=mi-l+1;
          exit;
        end;
      if data[dep][mi]>p then
        ri:=mi-1 else
        li:=mi+1;
    end;
  if data[dep][li]=p then
    begin
      getss:=li-l+1;
      exit;
    end;
  if data[dep][li]<p then
    getss:=li-l+1 else
    getss:=li-l;
end;

function getbiggersum(dep,ll,rr,l,r,p:longint):longint;
var
  mm,pp:longint;
begin
  if (ll=l) and (rr=r) then
    begin
      getbiggersum:=getss(dep,l,r,p);
      exit;
    end;
  mm:=(ll+rr) div 2;
  if r<=mm then
    begin
      getbiggersum:=getbiggersum(dep+1,ll,mm,l,r,p);
      exit;
    end;
  if l>mm then
    begin
      getbiggersum:=getbiggersum(dep+1,mm+1,rr,l,r,p);
      exit;
    end;
  getbiggersum:=getbiggersum(dep+1,ll,mm,l,mm,p)+getbiggersum(dep+1,mm+1,rr,mm+1,r,p);
end;

function get(l,r,k:longint):longint;
var
  ll,rr,mm,s,s1,s2:longint;
begin
  ll:=1;
  rr:=n;
  while ll<rr do
    begin
      mm:=(ll+rr) div 2;
      s:=getbiggersum(1,1,n,l,r,data[1][mm]);
      if s<k then
        ll:=mm+1 else
        rr:=mm;
    end;
  s1:=getbiggersum(1,1,n,l,r,data[1][ll]);
  s2:=getbiggersum(1,1,n,l,r,data[1][rr]);
  if s1<k then
    get:=data[1][rr] else
    get:=data[1][ll];
end;

procedure work;
var
  i,l,r,k:longint;
begin
  sort(1,n,1);
  for i:=1 to m do
    begin
      read(l,r,k);
      if i=101 then
        readln;
      writeln(get(l,r,k));
    end;
end;

begin
  setup;
  init;
  work;
  endit;
end.
