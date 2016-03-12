{
ID: xiaweiy1
PROG: calfflac
LANG: PASCAL
}
var dep,left,right,i,j,t,st,en,lmax,sum:longint;
    a:array[1..100]of char;
    f:array[1..100,1..100]of boolean;
    v:array[1..100]of boolean;
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
      inc(dep);
      read(a[dep]);
      if fp(ord(a[dep]))=false then v[dep]:=true;
      end;
close(input);
left:=1;
right:=dep;
while left<=dep do
      begin
      while v[left]=true do inc(left);
      if left>=right then break;
      pd:=true;
      if left>1 then
         for i:=left-1 downto 1 do
             if v[i]=true then continue else
                begin s1:=chg(a[i]);s2:=chg(a[left]);
                       if s1=s2 then
                          begin
                          for j:=left+1 to right do
                              if f[i,j]=true then begin f[left,j]:=true;pd:=false; end;
                          if pd=true then pd:=false;
                          break;
                          end;
                end;
      if pd=true then while left<right do
                            begin
                            while v[right]=true do dec(right);                            if left>=right then break;
                            s1:=chg(a[left]);s2:=chg(a[right]);
                            if s1=s2 then
                                     f[left,right]:=true;
                            dec(right);
                            end;
      inc(left); right:=dep;
      end;
lmax:=0;
for i:=1 to dep-1 do
    begin
    if v[i]=true then continue;
    j:=dep;
    while j>i do
          begin
          if f[i,j]=false then dec(j)
             else
             begin
             sum:=0;
             if j=i+1 then if 2>lmax then begin lmax:=2;st:=i;en:=j; end;
             pd:=true;
             left:=i+1;right:=j-1;
             while left<right do
                   begin
                   while v[left]=true do begin inc(left);inc(sum);end;
                   while v[right]=true do begin dec(right);inc(sum);end;
                   if left>=right then break;
                   if f[left,right]=false then begin pd:=false;break; end;
                   inc(left);
                   dec(right);
                   end;
             if (pd=true)and(j-i+1-sum>lmax) then begin lmax:=j-i+1-sum;st:=i;en:=j; end;
             dec(j);
	     end;
          end;
    end;
if lmax=0 then
    begin
    repeat
    inc(t);
    until (v[t]=false) and (t<=dep);
    writeln(1);
    for i:=1 to t do write(a[i]);
    writeln;
    end
    else
    begin
    writeln(lmax);
    for i:=st to en do write(a[i]);
    writeln;
    end;
close(output);
end.
