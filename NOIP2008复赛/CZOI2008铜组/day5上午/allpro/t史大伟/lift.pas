VAR  old,ne,p,n,a,b,i,k,s,t:longint;
    d,f,c:array[1..1000] of longint;
function  pd(t:longint):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to ne do
    if t=d[i] then begin pd:=false;break;end;
end;
BEGIN
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
read(n,a,b);
for i:=1 to n do
read(c[i]);
old:=1;
ne:=1;
d[1]:=1;
f[1]:=0;
p:=0;
while old<=ne do
      begin
      for i:=1 to 2 do
      case i of
      1:if (d[old]+c[d[old]])<=n then  begin
                                       t:=d[old]+c[d[old]];
                                       if pd(t) then begin
                                                     inc(ne);
                                                     d[ne]:=t;
                                                     f[ne]:=d[old];
                                                     if d[ne]=b then begin p:=1;break;end;
                                                     end;
                                       end;
      2:if (d[old]-c[d[old]])>0 then begin
                                     t:=d[old]-c[d[old]];
                                     if pd(t) then begin
                                                   inc(ne);
                                                    d[ne]:=t;
                                                     f[ne]:=d[old];
                                                     if d[ne]=b then begin p:=1;break;end;
                                                   end;
                                     end;
      end;
      if p=1 then break;
      old:=old+1;
      end;
      if old>ne then begin write('-1');close(input);close(output);exit;end;
      k:=ne;
      while f[k]<>0 do
      begin
      k:=f[k];
      inc(s);
      end;
writeln(s+1);
close(input);
close(output);
END.