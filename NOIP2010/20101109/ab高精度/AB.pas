type arr=array[-1..100]of longint;
var s1,s2,ss:string;
    mark1,mark2,pd,mark:boolean;
    a,b,c,tt,res,final:arr;
    i,t,k,tot:longint;
procedure print(x:arr);
var i:longint;
    ff,kk:boolean;
begin
ff:=true; kk:=false;   tot:=-1;
for i:=x[-1] downto 0 do
    begin
    if (ff)and(x[i]=0) then continue;
    if (ff)and(x[i]<>0) then ff:=false;
    kk:=true;
    inc(tot);
    final[tot]:=x[i];
    end;
if not kk then begin tot:=0; final[tot]:=0; end;
end;
function work(s:string):arr;
var i:longint;
begin
fillchar(tt,sizeof(tt),0);
tt[-1]:=length(s)-1;
for i:=1 to length(s) do
    begin
    tt[length(s)-i]:=ord(s[i])-ord('0');
    end;
exit(tt);
end;
function gjd(x,y:arr):arr;
var i,max:longint;
begin
if x[-1]>y[-1] then max:=x[-1] else max:=y[-1];
fillchar(res,sizeof(res),0);
for i:=0 to max do
   begin
   res[i]:=res[i]+x[i]+y[i];
   res[i+1]:=res[i+1]+res[i] div 10;
   res[i]:=res[i] mod 10;
   end;
if res[max+1]<>0 then inc(max);
res[-1]:=max;
exit(res);
end;
function gj(x,y:arr):arr;
var max,i,t:longint;
begin
if x[-1]>y[-1] then max:=x[-1] else max:=y[-1];
fillchar(res,sizeof(res),0);
for i:=0 to max do
   begin
   t:=x[i]-y[i];
   if t<0 then
      begin
       res[i+1]:=res[i+1]-1;
      t:=10+t;
      end;
   res[i]:=res[i]+t;
   end;
if res[max+1]<>0 then inc(max);
res[-1]:=max;
exit(res);
end;
procedure cmp;
var ts:string;
   i:longint;
begin
if (mark1=false)and(mark2=false) then
   begin
   if length(s1)<length(s2) then
      begin

      ts:=s1; s1:=s2; s2:=ts;
      exit;
      end;
   for i:=1 to length(s1) do
       begin
       if s1[i]<s2[i] then
          begin
          ts:=s1;s1:=s2;s2:=ts;
          exit;
          end;
       end;
   exit;
   end;
if (mark1=true)and(mark2=true) then
   begin
   delete(s1,1,1); delete(s2,1,1);
   exit;
   end;
if (mark1) then           //-441545 45
    begin
    if length(s1)-1<length(s2) then
       begin
       ts:=s1; s1:=s2; s2:=ts;
       delete(s2,1,1);
       exit;
       end;
    if length(s1)-1>length(s2) then
        begin
        delete(s1,1,1);
        pd:=false;
        exit;
        end;
    delete(s1,1,1);
    for i:=1 to length(s1) do
        begin
        if s1[i]>s2[i] then
           begin
           //delete(s1,1,1);
           pd:=false;
           exit;
           end;
        end;
    ts:=s1; s1:=s2; s2:=ts;
    //delete(s1,1,1);
    exit;
    end;
if (mark2) then
    begin
    if length(s2)-1>length(s1) then
       begin
       ts:=s1; s1:=s2; s2:=ts;
       delete(s1,1,1);
       pd:=false;
       exit;
       end;
    if length(s2)-1<length(s1) then
       begin
       //ts:=s1; s1:=s2; s2:=ts;
       delete(s2,1,1);
       //pd:=false;
       exit;
       end;
    delete(s2,1,1);
    for i:=1 to length(s1) do
        begin
        if s2[i]>s1[i] then
           begin
           //delete(s2,1,1);
           ts:=s1; s1:=s2; s2:=ts;
           pd:=false;
           exit;
           end;
        end;
    //delete(s2,1,1);
    exit;
    end;
end;
begin
assign(input,'AB.in');
reset(input);
assign(output,'AB.out');
rewrite(output);
readln(ss);
t:=pos(' ',ss);
s1:=copy(ss,1,t-1);
delete(ss,1,t);
s2:=ss;
for i:=1 to length(s2) do
    if s2[i]=' 'then k:=i;
delete(s2,k,length(s2)+1-k);
if s1[1]='-' then mark1:=true else mark1:=false;
if s2[1]='-' then mark2:=true else mark2:=false;
pd:=true; //a>b  true
cmp;
{if ((mark1=true)and(mark2=false))or((mark1=false)and(mark2=true)) then
   begin
   cmp(s1,s2);
   end;}
a:=work(s1);
b:=work(s2);
if ((mark1=true)and(mark2=true)) then mark:=true else mark:=false;
if mark then
   begin
   write('-');
   c:=gjd(a,b);
   print(c);
  // writeln;
   end
else begin
     if mark1 xor mark2=true then
        begin
        c:=gj(a,b);
        if not pd then
           begin
           {if not((c[-1]=0)and(c[0]=0)) then
            write('-'); }
           end;
        print(c);
       // writeln;
        end
     else
        begin
        if pd then
           begin
           c:=gjd(a,b);
           print(c);
           end
        else
           begin
           c:=gj(a,b);
           {if not((c[-1]=0)and(c[0]=0)) then
              write('-');    }
           print(c);
           end;

        //writeln;
        end;
     end;
if not pd then
   begin
   if not((tot=0)and(final[0]=0)) then write('-');
   end;
for i:=0 to tot do write(final[i]);
close(input);
close(output);
end.
