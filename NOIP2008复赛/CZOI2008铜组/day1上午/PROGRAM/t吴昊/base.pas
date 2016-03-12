var a,b,m,n,i,j,s,q,t,ls:longint;
    st1:string;
function jzzh(x,y:longint):string;
var i,k:longint;
    st:string;
begin
  while x<>0 do
    begin
    k:=x mod 10;
    if k<10 then st:=chr(ord(chr(k))-ord('0')+1)+st
       else st:=chr(ord('A')+k-1);
    x:=x div 10;
  end;
  jzzh:=st;
end;
function hw(s1:string):boolean;
var i:longint;
    ch:char;
begin
  hw:=true;
  for i:= length(s1) downto 1 do
    begin
      ch:=s1[length(s1)-i+1];
      if ch<>s1[i] then begin hw:=false;exit end;
    end;
end;
begin
  assign(input,'base.in');
  reset(input);
  assign(output,'base.out');
  rewrite(output);
  readln(a,b,m,n);
  for i:=a to b do
    if trunc(sqrt(i))=sqrt(i) then
    begin
       ls:=0;
       for j:=m to n do
         begin
           val(jzzh(i,j),t);
           str(t,st1);
           if hw(st1)=true then ls:=ls+1;
           if ls=1 then s:=s+1;
         end;
    end;
  writeln(s);
  close(input);
  close(output);
end.

