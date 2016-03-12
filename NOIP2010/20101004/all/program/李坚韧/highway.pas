var
  ans:longint;
  a1,k,a,b,c,n,m,t,i,j,root,d:longint;
  l,r,min:array[0..500000] of longint;

function build(ll,rr:longint):longint;
begin
  inc(k);
  build:=k;

  min[build]:=t;

  if ll=rr then exit;

  l[build]:=build(ll,(ll+rr) div 2);
  r[build]:=build((ll+rr) div 2+1,rr);
end;

function find(a1,ll,rr:longint):longint;
var
  temp:longint;
begin
  if (a<=ll)and(rr<=b) then exit(min[a1]);

  if ll=rr then exit;

  find:=maxlongint;
  if a<=(ll+rr) div 2 then
  begin
    temp:=find(l[a1],ll,(ll+rr) div 2);

    if temp<find then find:=temp;
  end;

  if b>=(ll+rr) div 2+1 then
  begin
    temp:=find(r[a1],(ll+rr) div 2+1,rr);

    if temp<find then find:=temp;
  end;

  exit(find);
end;

procedure insert1(a1,ll,rr,d:longint);
begin
  if (a<=ll)and(rr<=b) then dec(min[a1],d);

  if ll=rr then
    exit;

  if a<=(ll+rr) div 2 then
    insert1(l[a1],ll,(ll+rr) div 2,d);

  if b>=(ll+rr) div 2+1 then
    insert1(r[a1],(ll+rr) div 2+1,rr,d);
end;

procedure insert2(a1,ll,rr,d:longint);
begin
  if (a<=ll)and(rr<=b) then min[a1]:=d;

  if ll=rr then
    exit;

  if a<=(ll+rr) div 2 then
    insert1(l[a1],ll,(ll+rr) div 2,d);

  if b>=(ll+rr) div 2+1 then
    insert1(r[a1],(ll+rr) div 2+1,rr,d);
end;

begin
  assign(input,'highway.in');
  reset(input);
  assign(output,'highway.out');
  rewrite(output);

  read(n,m,t);

  root:=build(1,n);

  k:=1;
  while k<=m do
  begin
    read(a1,a,b,d);
   // writeln(find(root,1,b));

    if (a1=2)and(find(root,a,b)>0) then
    begin
      insert1(root,a,b,-d);
    end;

    if (a1=3)and(find(root,a,b)>0) then
    begin
      insert2(root,a,b,d);
    end;

    if a1=1 then
    begin
      //writeln(1,' ',b,' ',find(root,1,b));

      if find(root,1,b)>0 then
        inc(ans);
      //writeln(1,' ',b);
      //writeln(find(root,1,b));

      insert1(root,a,b,d);

      //writeln(1,' ',b);
      //writeln(find(root,a,b));
    end;

    inc(k);
    //writeln(find(root,1,b));
  end;

  writeln(ans);


  close(input);
  close(output);
end.




















