var a:array[1..20,0..20] of longint;
    i,j,k,n,m,l,x,y,tt,tot,xx,yy,pp,p:longint;
    f:array[1..9,0..9,0..18] of longint;
function pd(a,r,u:longint):boolean;
  var i:longint;
  begin
  pd:=false;
  for i:=1 to n do
      if f[r-1,u,i]=a then begin pd:=true; exit; end;
  end;
begin
assign(input,'spring.in');
reset(input);
assign(output,'spring.out');
rewrite(output);
read(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        read(a[i,j]);
    readln;
    end;
for i:=1 to n div 2 do
    for j:=0 to n div 2 do
        for k:=1 to n do
            f[i,j,k]:=1;
for i:=2 to n div 2 do
    begin
    tot:=maxlongint;
    for j:=1 to 9 do
        begin
        k:=f[i-1,j,0];
        tt:=maxlongint;
        for l:=1 to n-1 do
            for p:=l+1 to n do
                if (pd(l,i,j))and(pd(p,i,j))and(a[l,p]<tt)
                   then begin tt:=a[l,p]; x:=l; y:=p; end;
        if tt+k<tot then begin tot:=tt+k; xx:=x; yy:=y; end;
        end;
    f[i,0,0]:=f[i,pp,0];
    for k:=1 to 18 do
        f[i,0,k]:=f[i-1,pp,k];
    f[i,0,xx]:=0; f[i,0,yy]:=0;
    end;
writeln(f[n div 2,0,0]);
close(input);
close(output);
end.