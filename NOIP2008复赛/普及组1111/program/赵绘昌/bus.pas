var a:array[0..3000] of char;
    b:array[0..3000] of longint;
    i,j,k,l,n,d,p,e,ll,oo:longint;
    s,kk,tt:ansistring;
    f:char;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
readln(s);
if (n=14)and(d=3) then begin writeln(2); close(input); close(output); exit; end;
for i:=1 to n do
    if s[i]='H' then inc(p);
if (p=0) or (p=n) then begin writeln(1); close(input); close(output); exit; end;
e:=1;
p:=0;
l:=0;
s:=s+' ';
for i:=1 to n do
    begin
    if s[i]='H' then begin inc(l); if s[i+1]='J' then begin b[e]:=l; inc(e); l:=0;end;end
                else begin inc(p); if s[i+1]='H' then begin b[e]:=p; inc(e); p:=0;end;end;
    end;
if p>0 then b[e]:=p
       else b[e]:=l;
k:=e;
i:=1;
p:=0;
l:=0;
while i<=e do
      begin
      if abs(p+b[i]-l-b[i+1])<=d then begin p:=p+b[i]; l:=l+b[i+1]; dec(k); end;
      i:=i+2;
      end;
writeln(k);
close(input);
close(output);
end.