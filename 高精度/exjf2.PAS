var a,b,c:string;
    la,lb,k,x,y,t:longint;
begin
readln(a);
readln(b);
la:=length(a);
lb:=length(b);
k:=0;
while (la>0)and(lb>0) do
      begin
      x:=10+ord(a[la])-48-k;
      y:=ord(b[lb])-48;
      t:=(x-y) mod 10;
      if x-y<10 then k:=1 else k:=0;
      la:=la-1;
      lb:=lb-1;
      c:=char(t+48)+c;
      end;
while la>0 do
      begin
      x:=10+ord(a[la])-48-k;
      t:=x mod 10;
      if x<10 then k:=1 else k:=0;
      la:=la-1;
      lb:=lb-1;
      c:=char(t+48)+c;
      end;
while lb>0 do
      begin
      x:=10+ord(a[la])-48-k;
      t:=x mod 10;
      if x<10 then k:=1 else k:=0;
      la:=la-1;
      lb:=lb-1;
      c:=char(t+48)+c;
      end;
if (length(c)>1) and (c[1]='0') then delete(c,1,1);
writeln(c);
end.