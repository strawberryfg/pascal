var  i,h1,h2,m1,m2,s1,s2,hd,md,sd:longint;
     t1,t2,hh,mm,ss:string;
     code:integer;
     o:boolean;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);rewrite(output);
o:=true;
readln(t1);
readln(t2);
for i:=1 to 2 do
    hh:=hh+t1[i];
val(hh,h1,code);
for i:=4 to 5 do
    mm:=mm+t1[i];
val(mm,m1,code);
for i:=7 to 8 do
    ss:=ss+t1[i];
val(ss,s1,code);
hh:='';mm:='';ss:='';
for i:=1 to 2 do
    hh:=hh+t2[i];
val(hh,h2,code);
for i:=4 to 5 do
    mm:=mm+t2[i];
val(mm,m2,code);
for i:=7 to 8 do
    ss:=ss+t2[i];
val(ss,s2,code);
if s1-s2>=0 then
   sd:=s1-s2 else
     begin
     m1:=m1-1;
     sd:=s1-s2+60;
     end;
if m1-m2>=0 then
   md:=m1-m2 else
     begin
     h1:=h1-1;
     o:=false;
     md:=m1-m2+60;
     end;
hd:=h1-h2;
if (hd<0) then begin hd:=0-hd;md:=59-md;sd:=60-sd;if o=false then hd:=hd-1;end;
if (hd>12) then begin hd:=24-hd;end;
if hd<10 then
   write('0',hd,':') else write(hd,':');
if md<10 then
   write('0',md,':') else write(md,':');
if sd<10 then
   write('0',sd) else write(sd);
writeln;
close(input);close(output);
end.