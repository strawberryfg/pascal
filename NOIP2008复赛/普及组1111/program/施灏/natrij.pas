var xian,wei:string;
    hh,mm,ss,whh,wmm,wss,t,k:longint;
    x,w,cha:int64;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(xian);
readln(wei);
k:=10;
for t:=1 to 2 do
    begin
    hh:=(ord(xian[t])-48)*k+hh;
    k:=k div 10;
    end;
k:=10;
for t:=4 to 5 do
    begin
    mm:=(ord(xian[t])-48)*k+mm;
    k:=k div 10;
    end;
k:=10;
for t:=7 to 8 do
    begin
    ss:=(ord(xian[t])-48)*k+ss;
    k:=k div 10;
    end;
k:=10;
for t:=1 to 2 do
    begin
    whh:=(ord(wei[t])-48)*k+whh;
    k:=k div 10;
    end;
k:=10;
for t:=4 to 5 do
    begin
    wmm:=(ord(wei[t])-48)*k+wmm;
    k:=k div 10;
    end;
k:=10;
for t:=7 to 8 do
    begin
    wss:=(ord(wei[t])-48)*k+wss;
    k:=k div 10;
    end;
x:=hh*3600+mm*60+ss;
w:=whh*3600+wmm*60+wss;
if w>x then cha:=w-x
       else cha:=86400+w-x;
hh:=cha div 3600;
mm:=cha mod 3600 div 60;
ss:=cha mod 3600 mod 60;
if (hh<10)and(mm<10)and(ss<10)then begin writeln(0,hh,':0',mm,':0',ss);close(input);close(output);halt;end;
if (hh<10)and(mm>=10)and(ss<10)then begin writeln(0,hh,':',mm,':0',ss);close(input);close(output);halt;end;
if (hh<10)and(mm>=10)and(ss>=10)then begin writeln(0,hh,':',mm,':',ss);close(input);close(output);halt;end;
if (hh<10)and(mm<10)and(ss>=10)then begin writeln(0,hh,':0',mm,':',ss);close(input);close(output);halt;end;
if (hh>=10)and(mm<10)and(ss<10)then begin writeln(hh,':0',mm,':0',ss);close(input);close(output);halt;end;
if (hh>=10)and(mm<10)and(ss>=10)then begin writeln(hh,':0',mm,':',ss);close(input);close(output);halt;end;
if (hh>=10)and(mm>=10)and(ss<10)then begin writeln(hh,':',mm,':0',ss);close(input);close(output);halt;end;
if (hh>=10)and(mm>=10)and(ss>=10)then begin writeln(hh,':',mm,':',ss);close(input);close(output);halt;end;
end.
