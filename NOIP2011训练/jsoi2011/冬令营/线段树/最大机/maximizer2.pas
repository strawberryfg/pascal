var tt,n,m,i,t:longint;
        a,b,f,t,fan,f:atay[1..500000]of longint;

function min(a,b:longint):longint;
  begin
  if a<b then exit(a)
        else exit(b);
  end;

procedure tree(f,t,dep:longint);
  var i,mid:longint;
  begin
  mid:=(f+t) div 2;
  a[dep]:=f;b[dep]:=t;
  if f=t then begin
                if f<>1 then f[dep]:=maxlongint;
                fan[f]:=dep;
                exit;
                end;
  tree(f,mid,dep*2);
  tree(mid+1,t,dep*2+1);
  f[dep]:=min(f[dep*2],f[dep*2+1]);
  end;

function fmin(f,t,dep:longint):longint;
  var i,p1,p2:longint;
  begin
  p1:=maxlongint;
  p2:=maxlongint;
  if f<=a[dep] then if b[dep]<=t then exit(f[dep]);
  if f<=b[dep*2] then p1:=fmin(f,t,dep*2);
  if t>=a[dep*2+1] then p2:=fmin(f,t,dep*2+1);
  exit(min(p1,p2));
  end;

procedure def(f,dep,x:longint);
  var i:longint;
  begin
  if a[dep]=f then if f=b[dep] then begin f[dep]:=x;exit;end;
  if f<=b[dep*2] then def(f,dep*2,x)
                  else def(f,dep*2+1,x);
  f[dep]:=min(f[dep*2],f[dep*2+1]);
  end;

begin
assign(input,'maximizer.in');
reset(input);
assign(output,'maximizer.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
        readln(f[i],t[i]);
f[1]:=0;
tree(1,n,1);
for i:=1 to m do
        begin
        t:=fmin(f[i],t[i],1);
        if t<>maxlongint then
                         begin
                         tt:=fan[t[i]];
                         if f[tt]>t+1 then f[tt]:=t+1;
                         def(t[i],1,f[tt]);
                         end;
        end;
writeln(f[fan[n]]);
close(input);
close(output);
end.