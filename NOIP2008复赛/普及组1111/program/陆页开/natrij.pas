var p,s1,s2,a1,a2,a3,b1,b2,b3:string;
    rp,a,b,c:array[1..3] of longint;
    rprp:array[1..3] of string;
    t1,t2,tt,i:longint;
procedure setup;
  begin
  assign(input,'natrij.in');
  reset(input);
  assign(output,'natrij.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(s1);
readln(s2);
p:=copy(s1,1,2);
a1:=p;
p:=copy(s1,4,2);
a2:=p;
p:=copy(s1,7,2);
a3:=p;
p:=copy(s2,1,2);
b1:=p;
p:=copy(s2,4,2);
b2:=p;
p:=copy(s2,7,2);
b3:=p;
val(a1,a[1]);
val(a2,a[2]);
val(a3,a[3]);
val(b1,b[1]);
val(b2,b[2]);
val(b3,b[3]);
t1:=a[1]*3600+a[2]*60+a[3];
t2:=b[1]*3600+b[2]*60+b[3];
if t1=t2 then begin writeln('00:00:00');endit;halt;end;
if t1>t2 then begin
              t2:=t2+3600*24;
              tt:=t2-t1;
              end
         else tt:=t2-t1;
rp[1]:=tt div 3600;
tt:=tt-rp[1]*3600;
rp[2]:=tt div 60;
tt:=tt-rp[2]*60;
rp[3]:=tt;
for i:=1 to 3 do
    if rp[i] div 10=0 then begin str(rp[i],rprp[i]);rprp[i]:='0'+rprp[i];end
                      else begin str(rp[i],rprp[i]);end;
writeln(rprp[1],':',rprp[2],':',rprp[3]);
endit;
end.
