var s,str1,str2:string;
    k,i,j,hh1,hh2,hh3,hh4,h,mm1,mm2,mm3,mm4,ss1,ss2,ss3,ss4:longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(str1);
readln(str2);
str1:=str1+':';
str2:=str2+':';
k:=1;
for i:=1 to length(str1) do
    if str1[i]=':' then begin for j:=k to i-1 do
                          s:=s+str1[j];
    break;end;
   val(s,hh1);
   k:=i+1;
s:='';
for i:=k to length(str1) do
    if str1[i]=':' then begin for j:=k to i-1 do
                          s:=s+str1[j];
                          break;end;
   val(s,mm1);
   k:=i+1;
s:='';
for i:=k to length(str1) do
    if str1[i]=':' then begin for j:=k to i-1 do
                          s:=s+str1[j];
                          break;end;
   val(s,ss1);
   k:=i+1;
k:=1;
s:='';
for i:=1 to length(str2) do
    if str2[i]=':' then begin for j:=k to i-1 do
                          s:=s+str2[j];
                          break;end;
   val(s,hh2);
   k:=i+1;
s:='';
for i:=k to length(str2) do
    if str2[i]=':' then begin for j:=k to i-1 do
                          s:=s+str2[j];
                          break;end;
   val(s,mm2);
   k:=i+1;
s:='';
for i:=k to length(str2) do
    if str2[i]=':' then begin for j:=k to i-1 do
                          s:=s+str2[j];
                          break;end;
   val(s,ss2);
   k:=i+1;
hh3:=24;
mm3:=00;
ss3:=00;
if hh1<hh2 then begin
                  hh4:=hh2-hh1;
                  mm4:=mm2-mm1;
                  if ss2<ss1 then begin ss4:=60-ss1+ss2;
                                        if mm4>=1 then mm4:=mm4-1
                                                  else begin mm4:=59;hh4:=hh4-1;end;
                                  end
                             else ss4:=ss2-ss1;

                end
           else begin
                  hh4:=hh3-hh1+hh2;
                  mm4:=mm3-mm1+mm2;
                  ss4:=ss3-ss1+ss2;
                end;
if (hh4<=9)and (hh4>0) then write('0',hh4,':');
if hh4=0 then write('00',':');
if hh4>9 then write(hh4,':');
if (mm4<=9)and (mm4>0) then write('0',mm4,':');
if mm4=0 then write('00',':');
if mm4>9 then write(mm4,':');
if (ss4<=9)and (ss4>0) then write('0',ss4);
if ss4=0 then write('00');
if ss4>9 then write(ss4);
close(input);
close(output);
end.