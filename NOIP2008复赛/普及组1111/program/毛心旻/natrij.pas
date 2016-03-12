var t1,t2,fthh,ftmm,ftss:string;
    th1,tm1,ts1,th2,tm2,ts2,code,st1,st2,ans,fth,ftm:longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(t1);
readln(t2);
val(copy(t1,1,2),th1,code);
val(copy(t1,4,2),tm1,code);
val(copy(t1,7,2),ts1,code);
val(copy(t2,1,2),th2,code);
val(copy(t2,4,2),tm2,code);
val(copy(t2,7,2),ts2,code);
st1:=th1*3600+tm1*60+ts1;
st2:=th2*3600+tm2*60+ts2;
if st1<=st2 then ans:=st2-st1
            else ans:=86400-st1+st2;
fth:=ans div 60 div 60;
ans:=ans-(ans div 60 div 60)*3600;
ftm:=ans div 60;
ans:=ans-(ans div 60)*60;
str(fth,fthh);
str(ftm,ftmm);
str(ans,ftss);
if length(fthh)=1 then fthh:='0'+fthh;
if length(ftmm)=1 then ftmm:='0'+ftmm;
if length(ftss)=1 then ftss:='0'+ftss;
writeln(fthh,':',ftmm,':',ftss);
close(input);
close(output);
end.