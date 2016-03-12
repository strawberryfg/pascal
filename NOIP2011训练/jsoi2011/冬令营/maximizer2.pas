var tt,n,m,i,t:longint;
        a,b,aa,bb,fan,f:array[1..500000]of longint;

function min(a,b:longint):longint;
  begin
  if a<b then exit(a)
        else exit(b);
  end;

procedure tree(ll,rr,dep:longint);
  var i,mid:longint;
  begin
  mid:=(ll+rr) div 2;
  a[dep]:=ll;b[dep]:=rr;
  if ll=rr then begin
                if ll<>1 then f[dep]:=maxlongint;
                fan[ll]:=dep;
                exit;
                end;
  tree(ll,mid,dep*2);
  tree(mid+1,rr,dep*2+1);
  f[dep]:=min(f[dep*2],f[dep*2+1]);
  end;

function miin(aa,bb,dep:longint):longint;
  var i,p1,p2:longint;
  begin
  p1:=maxlongint;
  p2:=maxlongint;
  if aa<=a[dep] then if b[dep]<=bb then exit(f[dep]);
  if aa<=b[dep*2] then p1:=miin(aa,bb,dep*2);
  if bb>=a[dep*2+1] then p2:=miin(aa,bb,dep*2+1);
  exit(min(p1,p2));
  end;

procedure def(ll,dep,x:longint);
  var i:longint;
  begin
  if a[dep]=ll then if ll=b[dep] then begin f[dep]:=x;exit;end;
  if ll<=b[dep*2] then def(ll,dep*2,x)
                  else def(ll,dep*2+1,x);
  f[dep]:=min(f[dep*2],f[dep*2+1]);
  end;

begin
assign(input,'maximizer.in');
reset(input);
assign(output,'maximizer.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
        readln(aa[i],bb[i]);
f[1]:=0;
tree(1,n,1);
for i:=1 to m do
        begin
        t:=miin(aa[i],bb[i],1);
        if t<>maxlongint then
                         begin
                         tt:=fan[bb[i]];
                         if f[tt]>t+1 then f[tt]:=t+1;
                         def(bb[i],1,f[tt]);
                         end;
        end;
writeln(f[fan[n]]);
close(input);
close(output);
end.