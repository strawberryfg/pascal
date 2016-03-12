var n,m,i,j,t,d:longint;
    pd:boolean;
    a:array[0..1000]of char;
    c:array[0..1000,0..5000]of char;
    b:array[0..1000,'H'..'J']of longint;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
fillchar(a,sizeof(a),0);
fillchar(a,sizeof(a),0);
fillchar(a,sizeof(a),0);
readln(n,m);
for i:=1 to n do
    read(a[i]);
readln;
i:=1;
t:=1;
j:=1;
d:=0;
inc(b[t,a[i]]);
c[t,j]:=a[i];
pd:=true;
while i<n do
  begin
    inc(i);
    if pd then begin if a[i]<>c[t,j] then inc(d);pd:=false;if d>m then begin inc(t);d:=0;j:=0;pd:=true;end else begin inc(j);c[t,j]:=a[i];end;end 
          else begin inc(b[t,a[i]]);d:=abs(b[t,'H']-b[t,'J']);if d>m then begin inc(t);d:=0;j:=0;end else begin inc(j);c[t,j]:=a[i];pd:=true;end;end;
  end;
writeln(t);
close(input);
close(output);
end.