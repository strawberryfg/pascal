var a,b,c:string;
    la,lb,t,k:longint;
begin
readln(a);
readln(b);
la:=length(a);
lb:=length(b);
c:='';
k:=0;
while (la>0)and(lb>0) do
      begin
      t:=ord(a[la])-48+ord(b[lb])-48+k;
      if t>=10 then k:=1 else k:=0;
      t:=t-10*k;
      la:=la-1;
      lb:=lb-1;
      c:=char(t+48)+c;
      end;
while (la>0) do
      begin
      t:=ord(a[la])-48+k;
      if t>=10 then k:=1 else k:=0;
      t:=t-10*k;
      la:=la-1;
      c:=char(t+48)+c;
      end;
while (lb>0) do
      begin
      t:=ord(b[lb])-48+k;
      if t>=10 then k:=1 else k:=0;
      t:=t-10*k;
      lb:=lb-1;
      c:=char(t+48)+c;
      end;
if k=1 then c:='1'+c;
writeln(c);
end.