type arr=array[-1..100]of longint;
var s1,s2,s:string;
    tot:longint;
    a,b,c,d:arr;
procedure print(a:arr);
var i:longint;
begin
write(a[a[-1]]);
for i:=a[-1]-1 downto 0 do
    begin
    if a[i]>999 then write(a[i])
       else if a[i]>99 then write('0',a[i])
            else if a[i]>9 then write('00',a[i])
               else write('000',a[i]);
    end;
end;
function gjd(a,b:arr):arr;
var i,max:longint;
begin
fillchar(c,sizeof(c),0);
if a[-1]>b[-1] then max:=a[-1] else max:=b[-1];
for i:=0 to max do
    begin
    inc(c[i],a[i]+b[i]);
    inc(c[i+1],c[i]div 10000);
    c[i]:=c[i] mod 10000;
    end;
if c[max+1]<>0 then inc(max);
c[-1]:=max;
gjd:=c;
end;
begin
readln(s1);
readln(s2);
tot:=-1;
while length(s1)>=4 do
      begin
      s:=copy(s1,length(s1)-3,4);
      inc(tot);
      val(s,a[tot]);
      delete(s1,length(s1)-3,4);
      end;
if length(s1)<>0 then begin inc(tot);val(s1,a[tot]); end;
a[-1]:=tot;
tot:=-1;
while length(s2)>=4 do
      begin
      s:=copy(s2,length(s2)-3,4);
      inc(tot);
      val(s,b[tot]);
      delete(s2,length(s2)-3,4);
      end;
if length(s2)<>0 then begin inc(tot);val(s2,b[tot]); end;
b[-1]:=tot;
d:=gjd(a,b);
print(d);
end.
