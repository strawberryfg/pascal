{
ID: xiaweiy1
PROG: palsquare
LANG: PASCAL
}
const chr:array[10..20]of string=('A','B','C','D','E','F','G','H','I','J','K');
var b,i,j,t,k:longint;
    s,final,p,tmp:string;
begin
assign(input,'palsquare.in');
reset(input);
assign(output,'palsquare.out');
rewrite(output);
readln(b);
for i:=1 to 300 do
begin
t:=i;
p:='';
s:='';
while t div b<>0 do
      begin
      if t mod b>=10 then tmp:=chr[t mod b] else
      str(t mod b,tmp);
      p:=tmp+p;
      t:=t div b;
      end;
if t>=10 then tmp:=chr[t] else
str(t,tmp);
p:=tmp+p;
k:=i*i;
final:='';
while k div b<>0 do
      begin
      if k mod b>=10 then tmp:=chr[k mod b] else
      str(k mod b,tmp);
      final:=tmp+final;
      k:=k div b;
      end;
if k>=10 then tmp:=chr[k] else
str(k,tmp);
final:=tmp+final;
for j:=length(final) downto 1 do
    s:=s+final[j];
if s=final then writeln(p,' ',final);
end;
close(input);
close(output);
end.