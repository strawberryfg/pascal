type arr=array[-1..100]of longint;
var a,b,c,d:arr;
    s1,s2,s:string;
    tot:longint;
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
function mul(a,b:arr):arr;
var i,j,t,k,max:longint;
begin
max:=a[-1]+b[-1];
for i:=0 to a[-1] do
    for j:=0 to b[-1] do
        begin
        t:=a[i]*b[j];
        inc(c[i+j],t);
        k:=i+j;
        while c[k]>=10000 do
         begin
         if k>max then max:=k;
         c[k+1]:=c[k+1]+c[k] div 10000;
         c[k]:=c[k] mod 10000;
         inc(k);
         end;
        end;
while c[k]>=10000 do
 begin
 if k>max then max:=k;
 inc(c[k+1],c[k] div 10000);
 c[k]:=c[k]mod 10000;
 inc(k);
 end;
if c[k]<>0 then if k>max then max:=k;
mul:=c;
mul[-1]:=max;
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
d:=mul(a,b);
print(d);
end.
