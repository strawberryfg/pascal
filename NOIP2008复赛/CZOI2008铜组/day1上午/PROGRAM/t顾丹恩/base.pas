var a,b,c,d,m,n,i,j,k,h,l:longint;
v:array[1..40000] of longint;

function oo(a,b:longint):boolean;
var s1,s2:string; ch:char;
begin
s1:='';s2:='';
while a<>0 do
     begin
          case a mod b of
               0: ch:='0';
               1: ch:='1';
               2: ch:='2';
               3: ch:='3';
               4: ch:='4';
               5: ch:='5';
               6: ch:='6';
               7: ch:='7';
               8: ch:='8';
               9: ch:='9';
               10: ch:='A';
               11: ch:='B';
               12: ch:='C';
               13: ch:='D';
               14: ch:='E';
               15: ch:='F';
	       16: ch:='G';
	       17: ch:='H';
	       18: ch:='I';
	       19: ch:='J';
20: ch:='K';21: ch:='L';22: ch:='M';23: ch:='N';24: ch:='O';25: ch:='P';26: ch:='Q';
27: ch:='R';28: ch:='S';29: ch:='T';30: ch:='U';31: ch:='V';32: ch:='W';33: ch:='X';
34: ch:='Y';35: ch:='Z';
          end;
          s1:=ch+s1;s2:=s2+ch;
          a:=a div b
     end;
if s1=s2 then oo:=true
else oo:=false;
end;

begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(a,b,c,d);
j:=0;
for i:=trunc(sqrt(a)) to trunc(sqrt(b))+1 do
if (a<=i*i) and (b>=i*i) then
	begin
	inc(j);
	v[j]:=i*i;
	end;
l:=i-1;
m:=c;
for i:=1 to l do
for j:=c to d do
for k:=c+1 to d do
if oo(v[i],j) and oo(v[i],k) then for h:=i+1 to l do
                        begin
                        v[h]:=v[h+1];
                        l:=l-1;
                        end;
for k:=1 to l do
if v[k]<>0 then j:=j+1;
writeln(j);
close(input);
close(output);
end.
