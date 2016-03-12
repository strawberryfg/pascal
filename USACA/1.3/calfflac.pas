{
ID: xiaweiy1
PROG: calfflac
LANG: PASCAL
}
var dep,left,d,right,i,j,t,st,en,lmax,max,b,e:longint;
    a,s:array[1..20000]of char;
    x:array[1..20000]of integer;
    pd:boolean;
    s1,s2,ts1:char;
function fp(n:integer):boolean;
var t1,t2:integer;
begin
fp:=true;
t1:=n-64; t2:=n-96;
if not((t1>=1)and(t1<=26))then
   if not((t2>=1)and(t2<=26)) then fp:=false;
end;
procedure commd;
var tmax:longint;
begin
left:=i-1;right:=i+1;
while (left>0)and(right<d)and(s[left]=s[right]) do
       begin inc(right);dec(left); end;
if (s[left]=s[right])and(fp(ord(s[left]))=true) then begin tmax:=right-left+1;dec(left);inc(right); end else
tmax:=right-left-1;
if (tmax>max)and(tmax<>1) then begin max:=tmax;st:=x[left+1];en:=x[right-1]; end;
end;
function chg(s:char):char;
var t1,t2:integer;
begin
chg:=s;
t1:=ord(s)-64; t2:=ord(s)-96;
if (t2>=1)and(t2<=26) then chg:=chr(t2+64)
   else if not((t1>=1)and(t1<=26))then chg:=' ';
end;
begin
assign(input,'calfflac.in');
reset(input);
assign(output,'calfflac.out');
rewrite(output);
while not eof do
      begin
      while not eoln do
            begin
            inc(dep);
            read(a[dep]);
            s1:=chg(a[dep]);
            if fp(ord(a[dep]))=true then begin inc(d);s[d]:=s1;x[d]:=dep; end;
            end;
      inc(dep);a[dep]:=chr(10);
      readln;
      end;
for i:=2 to d-1 do
    begin
    max:=0;
    pd:=false;
    if s[i]=s[i+1] then begin max:=2;st:=i;en:=i+1;pd:=true; end;
    if pd=true then
       begin
       left:=i-1;right:=i+2;
       while (left>0)and(right<d)and(s[left]=s[right]) do
             begin inc(right);dec(left); end;
       if (s[left]=s[right])and(fp(ord(s[left]))=true) then begin max:=right-left+1;dec(left);inc(right);end else
       max:=right-left-1;
       st:=x[left+1]; en:=x[right-1];
       if (s[i]=s[i-1])and(s[i]=s[i+1]) then commd;
       end
       else
       commd;
    if max>lmax then begin lmax:=max;b:=st;e:=en;end;
    end;
if lmax=0 then
    begin
    writeln(1);
    for j:=1 to x[1] do write(a[j]);
    writeln;
    end
    else
    begin
    writeln(lmax);
    for j:=b to e do write(a[j]);
    writeln;
    end;
close(input);
close(output);
end.
