const x:array [1..35] of string=('1','2','3','4','5','6','7','8','9','a','b',
'c','d','e','f','g','h','i','j','k','l','m','n','o',
'p','q','r','s','t','u','v','w','x','y','z');
var   i,bs,es,bj,ej,s:longint;
function hui(n:string):boolean;
   var e,s,j,k:longint;
   begin
   s:=1;
   e:=length(n);
   while (e-s>1) and (n[e]=n[s]) do
      begin
      e:=e-1;
      s:=s+1;
      end;
      if (e=s) or (e-1=s) then hui:=true else hui:=false;
   end;
function pd(n:longint):boolean;
   var d:real; j,k:longint;
   begin
   d:=sqrt(n);
   pd:=false;
   if d-(trunc(sqrt(n)))=0 then pd:=true;
   end;
function pd1(n:longint):boolean;
   var i,s,j,k,t:longint;   a:string;
   begin
   s:=0;
   for i:=bj to ej do
      begin
      t:=n;
      a:='';
      while t>0 do
         begin
         j:=t mod i;
         a:=x[j]+a;
         t:=t div i;
         end;
         if hui(a)=true then s:=s+1;
      end;
      if s=1 then pd1:=true else pd1:=false;
   end;
begin
readln(bs,es,bj,ej);
s:=0;
for i:=bs to es do
   if (pd(i)=true) and (pd1(i)=true) then s:=s+1;
writeln(s);
end.