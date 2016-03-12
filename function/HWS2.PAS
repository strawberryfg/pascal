var a,b,c:string;
function jf(a,b:string):string;
         var c:string;
             la,t,k:longint;
         begin
         k:=0;
         la:=length(a);
         c:='';
         t:=0;
         while la>0 do
               begin
               t:=ord(a[la])-48+k+ord(b[la])-48;
               if t>=10 then k:=1 else k:=0;
               t:=t-10*k;
               la:=la-1;
               c:=char(t+48)+c;
               end;
         if k=1 then c:='1'+c;
         jf:=c;
         end;
function dx(n:string):string;
  var i:longint;
      s:string;
  begin
  i:=1;
  s:='';
  for i:=1 to length(n) do
      s:=n[i]+s;
  dx:=s;
  end;
begin
read(a);
b:=dx(a);
while a<>b do
      begin
      c:=jf(a,b);
      writeln(a,'+',b,'=',c);
      a:=c;
      b:=dx(a);
      end;
end.