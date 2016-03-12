var i,j,k,s,s1,b1,s2,b2:longint;
a:array[1..100000,1..35]of longint;
procedure kbase(a:array of longint);
var l:longint;
ch:char;
num:string;
begin
l:=a[i,9];
  while l<>0 do
     begin
          case l mod k of
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
               15: ch:='F'
          end;
          num:=ch+num;
          l:=l div k;
     end;
  a[i,k]:=num
end;
function pd(a:array of longint):boolean;
var l,g,k,m:longint;
b:array[1..100000]of longint;
begin
g:=1;
for l:=1 to 9 do
	if a[i,k] div g=0 then break
			else g:=g*10;
dec(l);
k:=l;
g:=1;
for l:=l downto 1 do
	begin
	b[g]:=a[i,k] mod 10;
	a[i,k]:=a[i,k] div 10;
	end;
for k:=k downto 1 do
	m:=m*10+b[k];
if m=a[i,k] then pd:=true
		else pd:=false;
end;
procedure wsqrt;
var i:longint;
begin
j:=1;
for i:=s1 to b1 do
	if trunc(sqrt(i))=sqrt(i) then begin a[j,9]:=i;inc(j);end;
dec(j);
end;
procedure zhuanhuan;
begin
for i:=1 to j do
	for k:=s2 to b2 do
		if k=9 then continue
			else kbase(a[i,k]);
end;
procedure huiwen;
begin
for i:=1 to j do
	for k:=s2 to b2 do
		if pd(a[i,k]) then inc(s);
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
read(s1,b1,s2,b2);
wsqrt;
zhuanhuan;
huiwen;
writeln(s);
close(input);
close(output);
end.