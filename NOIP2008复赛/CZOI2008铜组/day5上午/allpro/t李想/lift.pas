 var n,p,q,i,j,k,t,z:longint;
    a:array[1..200] of longint;
    b:array[1..10000] of longint;
procedure try(dep:longint);
  begin
  if dep=q then i:=i+1
           else begin
                inc(b[i]);
                if dep+a[dep]<=q then try(dep+a[dep]);
                if dep-a[dep]>=1 then try(dep-a[dep]);
                end;
  end;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
read(n);
read(p,q);
for i:=1 to n do
    read(a[i]);
i:=1;j:=0;
try(p);
for k:=1 to i-1 do
    for j:=k+1 to i-1 do
        if b[k]>b[j] then begin t:=b[k];b[k]:=b[j];b[j]:=t;end;
if b[1]<>0 then writeln(b[1])
           else writeln(-1);
  close(input);
  close(output);
end.
