var yu,shu,ying,max1,max2,max3,t1,t2,t3:string[30];
    n,i:longint;
function gaojingdu(a,b:string):string;
var la,lb,k,t,x,y:longint;
    c:string;
begin
gaojingdu:='';
la:=length(a);
lb:=length(b);
k:=0; c:='';
while (la>0)and(lb>0) do
      begin
      x:=ord(a[la])+10-48-k;
      y:=ord(b[lb])-48;
      t:=(x-y)mod 10;
      if x-y<10 then k:=1 else k:=0;
      c:=char(t+48)+c;
      dec(la);
      dec(lb);
      end;
while (la>0) do
      begin
      x:=ord(a[la])+10-48-k;
      t:=x mod 10;
      if x<10 then k:=1 else k:=0;
      c:=char(t+48)+c;
      dec(la);
      end;
if (length(c)>1)and(c[1]='0') then delete(c,1,1);
gaojingdu:=c;
end;
begin
assign(input,'score.in');
reset(input);
assign(output,'score.out');
rewrite(output);
readln(yu);
readln(shu);
readln(ying);
readln(n);
max1:=yu;
max2:=shu;
max3:=ying;
for i:=1 to n do
    begin
    readln(t1);
    readln(t2);
    readln(t3);
    if ((length(t1)=length(max1))and(t1>max1))or(length(t1)>length(max1))
    then max1:=t1;
    if ((length(t2)=length(max2))and(t2>max2))or(length(t2)>length(max2))
    then max2:=t2;
    if ((length(t3)=length(max3))and(t3>max3))or(length(t3)>length(max3))
    then max3:=t3;
    end;
if max1>yu then write(gaojingdu(max1,yu),' ') else write(0,' ');
if max2>shu then write(gaojingdu(max2,shu),' ') else write(0,' ');
if max3>ying then write(gaojingdu(max3,ying)) else write(0);
writeln;
close(input);
close(output);
end.
