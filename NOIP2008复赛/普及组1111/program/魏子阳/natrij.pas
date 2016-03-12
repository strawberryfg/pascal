var hh,mm,ss,hh1,hh2,mm1,mm2,ss1,ss2,i,n,j,k,l,t,sum:longint;
    s1,s2:string;
procedure slove;
begin
hh:=0;mm:=0;ss:=0;
if hh2<hh1 then begin hh:=24-hh1+hh2;end
           else begin hh:=hh2-hh1;end;
if mm2<mm1 then begin mm:=60-mm1+mm2;dec(hh);end
           else begin mm:=mm2-mm1;end;
if ss2<ss1 then begin ss:=60-ss1+ss2;dec(mm);end
           else begin ss:=ss2-ss1;end;
if mm<0 then begin dec(hh);mm:=mm+60;end;
end;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
readln(s1);
readln(s2);
hh1:=0;hh2:=0;mm1:=0;mm2:=0;ss1:=0;ss2:=0;
for i:=1 to 2 do
    begin
    hh1:=hh1*10+(ord(s1[i])-48);
    hh2:=hh2*10+(ord(s2[i])-48);
    end;
for i:=4 to 5 do
    begin
    mm1:=mm1*10+(ord(s1[i])-48);
    mm2:=mm2*10+(ord(s2[i])-48);
    end;
for i:=7 to 8 do
    begin
    ss1:=ss1*10+(ord(s1[i])-48);
    ss2:=ss2*10+(ord(s2[i])-48);
    end;
slove;
if hh<10 then write('0',hh)
         else write(hh);
write(':');
if mm<10 then write('0',mm)
         else write(mm);
write(':');
if ss<10 then write('0',ss)
         else write(ss);
close(input);
close(output);
end.