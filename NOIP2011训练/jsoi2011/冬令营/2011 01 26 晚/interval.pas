var

procedure tree(ll,rr,dep:longint);
  var i,mid:longint;
  begin
  mid:=(ll+rr) div 2;
  a[dep]:=ll;b[dep]:=rr;
  if ll=rr then exit;
  tree(ll,mid,dep*2);
  tree(mid+1,rr,dep*2+1);
  end;

procedure try1(ll,rr,dep:longint);
  begin
  if ll<=a[dep] then if b[dep]<=rr then
        begin
        inc(tip[dep,0]);
        tip[dep,tip[dep,0]]:=true;
        inc(ti[dep,0]);
        ti[dep,ti[dep,0]]:=2;
        end;
  if ll<=b[dep*2] then try1(ll,rr,dep*2);
  if rr>=a[dep*2+1] then try1(ll,rr,dep*2+1);
  end;

procedure try2(ll,rr,dep)

begin
readln(m);
sum:=0;
for i:=1 to m do
        begin
        readln(s[i]);
        val(s[i][5],t);
        if t>sum then sum:=t;
        end;
tree(1,sum*2,1);
fillchar(ji,sizeof(ji),false);
for i:=1 to m do
        begin
        ts:=s[i];
        a1:=ts[1];
        val(ts[2],aa);
        val(ts[5],bb);
        if ts[2]='[' then b1:=-1
                     else b1:=0;
        if ts[6]=']' then b2:=-1
                     else b2:=0;
        if a1='U' then try1(aa*2+b1,bb*2+b2,1);
        if
        end;
end.