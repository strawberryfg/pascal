{function gaojd(i:longint):string;
begin
  s:=0;
  for j:=1 to i do
  begin
    count:=count+i;
    if count>=1000000000 then begin count:=count-1000000000; inc(s); end;
  end;
  while s<>0 then begin gaojd:=gaojd+char(s mod 10+48); s:=s div 10; end;
  if gaojd='' then
     while count<>0 then
     begin gaojd:=gaojd+char(count mod 10+48); count:=count div 10; end;
              else
     p:=count;
     while p<>0 then begin inc(time); p:=p div 10; end;
     for j:=1 to 9-time do gaojd:=gaojd+'0';
     while count<>0 then
     begin gaojd:=gaojd+char(count mod 10+48); count:=count div 10; end;
end;}
var ffrom,tto,too,frrom,i,j,count:longint;
    s:shortint;
    cun:string;
procedure ppp(jzzh:string;t:longint);
begin
     case t of
         1:jzzh:='1'+jzzh;2:jzzh:='2'+jzzh;3:jzzh:='3'+jzzh;
         4:jzzh:='4'+jzzh;5:jzzh:='5'+jzzh;6:jzzh:='6'+jzzh;
         7:jzzh:='7'+jzzh;8:jzzh:='8'+jzzh;9:jzzh:='9'+jzzh;
         10:jzzh:='A'+jzzh;11:jzzh:='B'+jzzh;12:jzzh:='C'+jzzh;
         13:jzzh:='D'+jzzh;14:jzzh:='E'+jzzh;15:jzzh:='F'+jzzh;
         16:jzzh:='G'+jzzh;17:jzzh:='H'+jzzh;18:jzzh:='I'+jzzh;
         19:jzzh:='J'+jzzh;20:jzzh:='K'+jzzh;21:jzzh:='L'+jzzh;
         22:jzzh:='M'+jzzh;23:jzzh:='N'+jzzh;24:jzzh:='O'+jzzh;
         25:jzzh:='P'+jzzh;26:jzzh:='Q'+jzzh;27:jzzh:='R'+jzzh;
         28:jzzh:='S'+jzzh;29:jzzh:='T'+jzzh;30:jzzh:='U'+jzzh;
         31:jzzh:='V'+jzzh;32:jzzh:='W'+jzzh;33:jzzh:='X'+jzzh;
         34:jzzh:='Y'+jzzh;35:jzzh:='Z'+jzzh;
     end;
end;
function jzzh(j:shortint; s:int64):string;
var t:longint;
begin
     jzzh:='';
     while s>=j do
     begin
       t:=s div j;
       s:=s div j;
       ppp(jzzh,t);
     end;
     ppp(jzzh,s);
end;
function pd(cun:string):boolean;
var i:longint;
begin
  pd:=true;
  for i:=1 to length(cun) do
  begin
    if cun[i]<>cun[length(cun)+1-i] then begin pd:=false; exit; end;
  end;
end;
begin
  assign(input,'base.in');
  reset(input);
  assign(output,'base.out');
  rewrite(output);
  readln(ffrom,tto,frrom,too);
  for i:=ffrom to tto do
  begin
    s:=0;
    for j:=frrom to too do
    begin
        cun:=jzzh(j,i*i);
        if pd(cun) then begin s:=1; break; end;
    end;
    if s=0 then count:=count+1;
  end;
  writeln(count);
  close(input);
  close(output);
end.
