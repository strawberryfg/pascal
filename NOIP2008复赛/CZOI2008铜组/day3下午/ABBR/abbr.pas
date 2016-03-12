const spe:array[1..10]of string=('i','pa','te','ni','niti','a','ali','nego','no','ili');
var s,st:string;
    pd,check:boolean;
    j,t:longint;
begin
assign(input,'abbr.in');
reset(input);
assign(output,'abbr.out');
rewrite(output);
readln(s);
t:=pos(' ',s);
pd:=true;
while t<>0 do
      begin
      st:=copy(s,1,t-1);
      check:=true;
      for j:=1 to 10 do
          if st=spe[j] then begin check:=false;break;end;
      if (check=true)or((check=false)and(pd=true)) then
         write(char(ord(st[1])-32));
      pd:=false;
      delete(s,1,t);
      t:=pos(' ',s);
      end;
check:=true;
st:=s;
for j:=1 to 10 do
    if st=spe[j] then begin check:=false;break;end;
if check=true then write(char(ord(st[1])-32));
close(input);
close(output);
end.