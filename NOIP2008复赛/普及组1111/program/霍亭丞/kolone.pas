var n1,n2,t,i:longint;s,s1,s2:string;
function pd(q,p:char):boolean;
begin
pd:=false;
if (pos(p,s2)<>0)and(pos(q,s1)<>0) then
   pd:=true;
end;
procedure jh;
var la,j,f:longint;w:char;
begin
la:=length(s);
for j:=1 to la do
    if pd(s[j],s[j+1])=true then
       begin
       w:=s[j];
       s[j]:=s[j+1];
       s[j+1]:=w;
       f:=j;
       break;
       end;
while f<la do
      begin
      f:=f+2;
      if pd(s[f],s[f+1])=true then
       begin
       w:=s[f];
       s[f]:=s[f+1];
       s[f+1]:=w;
       end;
      end;
end;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);rewrite(output);
readln(n1,n2);
readln(s1);
for i:=n1 downto 1 do
    s:=s+s1[i];
readln(s2);
for i:=1 to n2 do
    s:=s+s2[i];
readln(t);
for i:=0 to n1+n2 do
    begin
    if i=t then break;
    jh;
    end;
for i:=1 to length(s) do
    write(s[i]);
writeln;
close(input);close(output);
end.