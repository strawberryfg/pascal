var max:int64;
        i,n,a,b,k:longint;
        p:array[0..1000000]of int64;

procedure try(ll,rr:longint);
  var i,t,j:longint;
        tt,x:int64;
  begin
  t:=random(rr-ll)+ll;
  tt:=p[ll];p[ll]:=p[t];p[t]:=tt;
  i:=ll;j:=rr;
  x:=p[ll];
  while i<j do
        begin
        while (i<j)and(p[j]>=x) do dec(j);
        if i<j then begin p[i]:=p[j];inc(i); end;
        while (i<j)and(p[i]<=x) do inc(i);
        if i<j then begin p[j]:=p[i];dec(j); end;
        end;
  p[i]:=x;
  if i=k then begin writeln(p[i]);exit; end;
  if i<k then try(i+1,rr);
  if i>k then try(ll,i-1);
  end;

begin
max:=99784356741997;
while not eof do
        begin
        readln(n,a,b,k);
        p[0]:=0;
        for i:=1 to n do
                p[i]:=(p[i-1]*a+b)mod max;
        try(1,n);
        end;
end.