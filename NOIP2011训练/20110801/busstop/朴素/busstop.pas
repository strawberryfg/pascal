var a:array[0..2000,0..2000]of longint;
    i,j,m,n,e,k,t1,t2,s:longint;
    f,p,z,l:array[0..2000]of longint;
procedure work(c,dep:longint);
var i:longint;
begin
if c=n then begin inc(s);for i:=1 to dep-1 do inc(p[l[i]]);exit;end;
for i:=1 to a[c,0] do if f[a[c,i]]=0
 then begin f[a[c,i]]:=1;l[dep+1]:=a[c,i];work(a[c,i],dep+1);f[a[c,i]]:=0;end;
end;

begin
assign(input,'busstop.in');reset(input);
assign(output,'busstop.out');rewrite(output);
readln(n,e);for i:=1 to e do begin readln(t1,t2);
 inc(a[t1,0]);a[t1,a[t1,0]]:=t2;inc(a[t2,0]);a[t2,a[t2,0]]:=t1;end;
work(1,1);
for i:=1 to n do if p[i]=s then begin inc(k);z[k]:=i;end;
writeln(k);
for i:=1 to k-1 do write(z[i],' ');writeln(z[k]);
close(input);close(output);
end.
