var n,z,m,i,t:longint;
    a:array[1..1000]of integer;
    f:array[1..1000]of integer;
procedure try(m,dep:longint);
var p,now:longint;
    pd:boolean;
begin
p:=1;
now:=1;
pd:=false;
while pd=false do
      begin
      now:=now+p;
      if now>dep then now:=now-dep;
      if (a[now]=1)or(f[now]=1) then begin inc(p);fillchar(f,sizeof(f),0); now:=1; end
         else begin
              if now=m then pd:=true;
              f[now]:=1;
              end;
      end;
writeln(p);
end;
begin
assign(input,'comfort.in');
reset(input);
assign(output,'comfort.out');
rewrite(output);
readln(n,z,m);
for i:=1 to m do
    begin
    read(t);
    a[t]:=1;
    end;
try(z,n);
close(input);
close(output);
end.
