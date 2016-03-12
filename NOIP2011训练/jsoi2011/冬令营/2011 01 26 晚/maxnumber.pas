var m,p,tot,ta,i,x:longint;
        aa:char;
        a,b,nmin,nmax:array[1..200000]of longint;

function max(a,b:longint):longint;
  begin
  if a>b then exit(a)
        else exit(b);
  end;

procedure tree(ll,rr,dep:longint);
  var mid,i:longint;
  begin
  mid:=(ll+rr) div 2;
  a[dep]:=ll;b[dep]:=rr;
  if ll=rr then exit;
  tree(ll,mid,dep*2);
  tree(mid+1,rr,dep*2+1);
  end;

procedure change(t,dep,ta:longint);
  var i:longint;
  begin
  if t=a[dep] then if t=b[dep] then
                                begin
                                nmax[dep]:=ta;
                                exit;
                                end;
  if t<=b[dep*2] then change(t,dep*2,ta)
                 else change(t,dep*2+1,ta);
  nmax[dep]:=max(nmax[dep*2],nmax[dep*2+1]);
  end;

function maax(ll,rr,dep:longint):longint;
  var i,p1,p2:longint;
  begin
  p1:=-maxlongint;
  p2:=-maxlongint;
  if ll<=a[dep] then if b[dep]<=rr then exit(nmax[dep]);
  if ll<=b[dep*2] then p1:=maax(ll,rr,dep*2);
  if rr>=a[dep*2+1] then p2:=maax(ll,rr,dep*2+1);
  exit(max(p1,p2));
  end;

begin
assign(input,'maxnumber.in');
reset(input);
assign(output,'maxnumber.out');
rewrite(output);
fillchar(a,sizeof(a),0);
fillchar(b,sizeof(b),0);
fillchar(nmin,sizeof(nmin),0);
fillchar(nmax,sizeof(nmax),0);
readln(m,p);
tree(1,m,1);
tot:=0;
ta:=0;
for i:=1 to m do
        begin
        read(aa);
        readln(x);
        if aa='A' then
                        begin
                        inc(tot);
                        change(tot,1,(x+ta) mod p);
                        end;
        if aa='Q' then
                        begin
                        ta:=maax(tot-x+1,tot,1);
                        writeln(ta);
                        end;
        end;
close(input);
close(output);
end.