var i,j,t1,t2,k,la,lb,find:longint;
    c:array[0..1000]of longint;
    n1,m1,n2,m2,n,m,res,res1,res2,final,str:ansistring;
function gjd(a,b:ansistring):ansistring;
var c,t:ansistring;
    k,la,m,i:longint;
begin
c:=''; k:=0;
if length(a)<length(b) then begin t:=a;a:=b;b:=t; end;
for i:=1 to length(a)-length(b) do b:='0'+b;
la:=length(a);
while la>0 do
 begin
 m:=ord(a[la])+ord(b[la])-96+k;
 if m>=10 then k:=1 else k:=0;
 m:=m mod 10;
 c:=char(m+48)+c;
 dec(la);
 end;
if k=1 then c:='1'+c;
gjd:=c;
end;
function mul(a,b:ansistring):ansistring;
var s:ansistring;
begin
la:=length(a);
lb:=length(b);
s:='';
for i:=0 to la-1 do
    for j:=0 to lb-1 do
        begin
        t1:=ord(a[la-i])-48; t2:=ord(b[lb-j])-48;
        k:=t1*t2;
        inc(c[i+j],k);
        end;
for i:=0 to la+lb-1 do
    begin
    k:=c[i] mod 10;
    c[i+1]:=c[i+1]+c[i] div 10;
    c[i]:=k;
    s:=char(c[i]+48)+s;
    end;
if (length(s)>1)and(s[1]='0') then delete(s,1,1);
mul:=s;
end;
function decc(a:ansistring):ansistring;
var i,k,t:longint;
begin
k:=0;
for i:=length(a) downto 1 do
    begin
    t:=ord(a[i])-48-1+k;
    if t<0 then begin k:=-1; t:=10+t; end else k:=0;
    a[i]:=char(t+48);
    if k=0 then break;
    end;
if (length(a)>1)and(a[1]='0') then delete(a,1,1);
decc:=a;
end;
function divide(a:ansistring):ansistring;
var c:ansistring;
    yu,i,t:longint;
begin
c:=''; yu:=0;
for i:=1 to length(a) do
    begin
    if yu=1 then t:=ord(a[i])-48+10 else t:=ord(a[i])-48;
    c:=c+char((t div 2)+48);
    if t mod 2=0 then yu:=0 else yu:=1;
    end;
if (length(c)>1)and(c[1]='0') then delete(c,1,1);
divide:=c;
end;
procedure work;
var ta,tmp,tb,tt:ansistring;
begin
ta:=gjd(n1,'1');
ta:=mul(ta,n1);
ta:=divide(ta);
tmp:=m1;
tt:='';

  fillchar(c,sizeof(c),0);
  tb:=gjd(tmp,'1');
  tb:=mul(tb,tmp);
  tb:=divide(tb);
  tt:=gjd(tt,tb);

fillchar(c,sizeof(c),0);
res:=mul(ta,tt);
end;
procedure work1;
var ta,tmp,tb,tt:ansistring;
begin
tt:='';
fillchar(c,sizeof(c),0);
ta:=gjd(n2,'1');
ta:=mul(ta,n2);
ta:=divide(ta);
tmp:=m2;

  fillchar(c,sizeof(c),0);
  tb:=gjd(tmp,'1');
  tb:=mul(tb,tmp);
  tb:=divide(tb);
  tt:=gjd(tt,tb);

fillchar(c,sizeof(c),0);
res1:=mul(ta,tt);
end;
function jian(a,b:ansistring):ansistring;
var c:ansistring;
    k,i,la,t:longint;
begin
c:='';
k:=0;
for i:=length(a)-length(b)downto 1 do b:='0'+b;
la:=length(a);
while la>0 do
   begin
   t:=ord(a[la])-ord(b[la])+k;
   if t<0 then begin k:=-1;t:=10+t; end else k:=0;
   c:=char(t+48)+c;
   dec(la);
   end;
if (length(c)>1)and(c[1]='0') then delete(c,1,1);
jian:=c;
end;
procedure work2;
var ta,tmp,tb,tt:ansistring;
begin
  fillchar(c,sizeof(c),0);
ta:=gjd(n,'1');
ta:=mul(ta,n);
ta:=divide(ta);
tmp:=m;
tt:='';

  fillchar(c,sizeof(c),0);
  tb:=gjd(tmp,'1');
  tb:=mul(tb,tmp);
  tb:=divide(tb);
  tt:=gjd(tt,tb);

fillchar(c,sizeof(c),0);
res2:=mul(ta,tt);
end;
begin
assign(input,'rectangle.in');
reset(input);
assign(output,'rectangle.out');
rewrite(output);
readln(n1);
readln(m1);
readln(n2);
readln(m2);
{readln(str);
find:=pos(' ',str);
n1:=copy(str,1,find-1);
delete(str,1,find);
find:=pos(' ',str);
m1:=copy(str,1,find-1);
delete(str,1,find);
find:=pos(' ',str);
n2:=copy(str,1,find-1);
delete(str,1,find);
m2:=str;  }
work;
work1;
final:=gjd(res,res1);
n:=n1; m:=m1;
if (length(n1)=length(n2))and(n1>n2) then n:=n2;
if length(n)>length(n2) then n:=n2;
if (length(m1)=length(m2))and(m1>m2) then m:=m2;
if length(m)>length(m2) then m:=m2;
work2;
final:=jian(final,res2);
writeln(final);
close(input);
close(output);
end.
