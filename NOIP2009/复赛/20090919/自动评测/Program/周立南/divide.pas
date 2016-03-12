var e,s,n,ans,m,i,k,c:longint;
    a:array [0..10005] of longint;
    b:array [0..10005] of record
                            st,en:longint;
                          end;

procedure qsort(l,r:longint);
var i,j,mid,temp:longint;
begin
  i:=l;
  j:=r;
  mid:=a[(i+j) div 2];
  repeat
    while a[i]<mid do inc(i);
    while a[j]>mid do dec(j);
    if i<=j then begin
                   temp:=a[i];
                   a[i]:=a[j];
                   a[j]:=temp;
                   inc(i);
                   dec(j);
                 end;
  until i>j;
  if i<r then qsort(i,r);
  if j>l then qsort(l,j);
end;

begin
  assign(input,'divide.in');
  assign(output,'divide.out');
  reset(input);
  rewrite(output);
  readln(n,k,c);
  for i:=1 to n do read(a[i]);
  qsort(1,n);
  s:=0;
  i:=0;
  while s<=n do
    begin
      inc(i);
      e:=s+k;
      inc(s);
      if e>n then begin
                   //b[i-1].tot:=c+sqr(a[n]-a[s-k]);
                    b[i-1].st:=s-k;
                    b[i-1].en:=n;
                    dec(i);
                    break;
                  end;
     // b[i].tot:=c+sqr(a[e]-a[s]);
      b[i].st:=s;
      b[i].en:=e;
      s:=e;
    end;
  m:=i;
  s:=1;
  ans:=0;
  e:=0;
  while e<m do
    begin
      e:=s;
      while (sqr(a[b[e].en]-a[b[s].st])<c) and (e<=m) do
        inc(e);
      if (e>s) then dec(e);
      ans:=ans+c+sqr(a[b[e].en]-a[b[s].st]);
      s:=e+1;
    end;
  writeln(ans);
  close(input);
  close(output);
end.
