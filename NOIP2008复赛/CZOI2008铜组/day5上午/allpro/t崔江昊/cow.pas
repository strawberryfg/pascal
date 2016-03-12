var i,n:longint; s:int64; a:array[1..137] of int64;
b:array[130..200] of string;
function fun(a,b:string):string;
   var c:string;  la,lb,t,p:longint;
   begin
   la:=length(a);
   lb:=length(b);
   t:=0;
   c:='';
   while lb>0  do
      begin
      p:=ord(a[la])-48+ord(b[lb])-48+t;
      if p>=10 then begin t:=1; p:=p mod 10; end
      else t:=0;
      c:=char(p+48)+c;
      lb:=lb-1;
      la:=la-1;
      end;
      while la>0 do
      begin
      p:=ord(a[la])-48+t;
      if p>=10 then begin t:=1; p:=p mod 10;end
      else t:=0;
      c:=char(p+48)+c;
      la:=la-1;
      end;
      if t=1 then c:='1'+c;
      fun:=c;
   end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
a[1]:=1;
a[2]:=1;
a[3]:=1;
a[4]:=2;
if n<=4 then begin writeln(a[n]); close(input); close(output);halt;end;
s:=2;
if n<=137 then
begin
for i:=5 to n do
   begin
   s:=s+a[i-4];
   a[i]:=s;
   end;
   writeln(s);
   close(input);
   close(output);
   halt;
   end
   else
   begin
   for i:=5 to 137 do
        begin
        s:=s+a[i-4];
        a[i]:=s;
        end;
   for i:=130 to 137 do
      str(a[i],b[i]);
   for i:=138 to n do
   b[i]:=fun(b[i-1],b[i-4]);
   end;
writeln(b[n]);
close(input);
close(output);
end.
