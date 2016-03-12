const maxn=1024;
var
	l1,l2,i,j,temp,t:longint;
	p,b:array[1..maxn]of longint;
	s1,s2:array[1..maxn]of char;
	s:array[1..maxn*2]of char;
	tcmp:char;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(l1,l2);
for i:=1 to l1 do
	read(s1[i]);
readln;
for i:=1 to l2 do
	read(s2[i]);
readln;
readln(t);
for i:=1 to l1 div 2 do
	begin
	tcmp:=s1[i];
	s1[i]:=s1[l1-i+1];
	s1[l1-i+1]:=tcmp;
	end;
for i:=1 to l1 do
	begin
	p[i]:=1;
	s[i]:=s1[i];
	end;
for i:=l1+1 to l2+l1 do
	begin
	p[i]:=2;
	s[i]:=s2[i-l1]
	end;
for i:=1 to t do
	begin
	for j:=1 to l1+l2-1 do
		if (p[j]=1)and(p[j+1]=2)and(b[j]=0)and(b[j+1]=0)
			then begin
			tcmp:=s[j];
			s[j]:=s[j+1];
			s[j+1]:=tcmp;
			temp:=p[j];
			p[j]:=p[j+1];
			p[j+1]:=temp;
                        b[j]:=1;
                        b[j+1]:=1;
			end;
        fillchar(b,sizeof(b),0);
	end;
writeln(s);
close(input);
close(output);
end.
