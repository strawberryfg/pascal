var a,b,c:string;
    la,lb,t,k:longint;
    x:boolean;
begin
readln(a);
la:=1;
lb:=length(a);
while la<=(length(a)+1)div 2 do
      begin
      if a[la]<>a[lb] then begin x:=true;break;end;
      la:=la+1;
      lb:=lb-1;
      end;
if x=true then
   begin
   repeat
   x:=false;
   la:=1;
   lb:=length(a);
   k:=0;
   while la<=length(a) do
         begin
         t:=ord(a[la])-48+ord(a[lb])-48+k;
      	 if t>=10 then k:=1 else k:=0;
         t:=t-10*k;
         b:=b+a[lb];
         la:=la+1;
         lb:=lb-1;
         c:=char(t+48)+c;
         end;
   if k=1 then c:='1'+c;
   la:=1;
   lb:=length(c);
   while la<=(length(c)+1)div 2 do
      begin
      if c[la]<>c[lb] then begin x:=true;break;end;
      la:=la+1;
      lb:=lb-1;
      end;
   if (length(b)>1) and (b[1]='0') then delete(b,1,1);
   writeln(a,'+',b,'=',c);
   if x=true then begin a:=c;c:='';b:=''; end;
   until x=false;
end;
end.