var s,ts,a:string;
    hour,minute,second,hh,mm,ss,th,tm,tss:longint;
    code:integer;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(s);
ts:=copy(s,1,2);
val(ts,hh,code);
delete(s,1,3);
ts:=copy(s,1,2);
val(ts,mm,code);
delete(s,1,3);
val(s,ss,code);

readln(s);
ts:=copy(s,1,2);
val(ts,hour,code);
delete(s,1,3);
ts:=copy(s,1,2);
val(ts,minute,code);
delete(s,1,3);
val(s,second,code);
if second<ss then begin tss:=second+60-ss; dec(tm); end
             else tss:=second-ss;
if tss=-1 then begin tss:=59; dec(tm); end;
if minute<mm then begin tm:=tm+minute+60-mm; dec(th); end
             else tm:=tm+minute-mm;
if tm=-1 then begin tm:=59; dec(th); end;
if hour<hh then th:=th+24+hour-hh else th:=th+hour-hh;
if th=-1 then th:=23;
if (th=0)and(tm=0)and(tss=0) then begin th:=24;tm:=0;tss:=0; end;
str(th,a); if length(a)=1 then a:='0'+a; write(a,':');
str(tm,a); if length(a)=1 then a:='0'+a; write(a,':');
str(tss,a); if length(a)=1 then a:='0'+a; write(a);
writeln;
close(input);
close(output);
end.
