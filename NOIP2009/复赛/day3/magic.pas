var n,old,ne,i,j,now,maxx:longint;
    s,ts,us,res,spe,del1,del2:string;
    hash:array[1..20000000]of byte;
    a,sum:array[1..5000000]of longint;
    c,d,e:array[0..25]of longint;
    code:integer;
function gj(a,b:string):string;
var c:string;
    la,lb,k,x,y,t,i:longint;
begin
la:=length(a);
lb:=length(b);
for i:=1 to la-lb do b:='0'+b;
k:=0;
c:='';
while (la>0) do
      begin
      x:=ord(a[la])-ord(b[la])-k;
      if x<0 then begin k:=1;x:=x+10; end else k:=0;
      la:=la-1;
      c:=char(x+48)+c;
      end;
if (length(c)>1) and (c[1]='0') then delete(c,1,1);
gj:=c;
end;
function gjd(a,b:string):string;
var t,k,la,lb,i:longint;
    s,c:string;
begin
la:=length(a); lb:=length(b);
if la<lb then begin s:=a;a:=b;b:=s; la:=lb; end;
k:=0;
for i:=length(a)-length(b) downto 1 do b:='0'+b;
while la>0 do
 begin
 t:=ord(a[la])-48+ord(b[la])-48+k;
 if t>=10 then k:=1 else k:=0;
 t:=t mod 10;
 c:=char(t+48)+c;
 dec(la);
 end;
if k=1 then c:='1'+c;
gjd:=c;
end;
function mul(x,y:string):string;
var tx,ty,s,ts:string;
    na,nb,i,j,k,t,max:longint;
begin
tx:=x;
ty:=y;
na:=0;
nb:=0;
fillchar(c,sizeof(c),0);
fillchar(d,sizeof(d),0);
fillchar(e,sizeof(e),0);
while length(tx)>=4 do
  begin
  s:=copy(tx,length(tx)+1-4,4);
  val(s,c[na],code);
  if length(tx)=4 then tx:=''
     else tx:=copy(tx,1,length(tx)+1-5);
  inc(na);
  end;
if tx<>'' then val(tx,c[na],code);
while length(ty)>=4 do
  begin
  s:=copy(ty,length(ty)+1-4,4);
  val(s,d[nb],code);
  if length(ty)=4 then ty:=''
     else ty:=copy(ty,1,length(ty)+1-5);
  inc(nb);
  end;
if ty<>'' then val(ty,d[nb],code);
max:=na+nb;
for i:=0 to na do
    for j:=0 to nb do
       begin
       t:=c[i]*d[j];
       inc(e[i+j],t);
       k:=i+j;
       while e[k]>=10000 do
         begin
         if k>max then max:=k;
         t:=e[k] div 10000;
         inc(e[k+1],t);
         e[k]:=e[k] mod 10000;
         inc(k);
         end;
       if e[k]<>0 then if k>max then max:=k;
       end;
while e[k]>=10000 do
         begin
         if k>max then max:=k;
         t:=e[k] div 10000;
         inc(e[k+1],t);
         e[k]:=e[k] mod 10000;
         inc(k);
         end;
if e[k]<>0 then if k>max then max:=k;
ts:='';
for i:=max downto 0 do
    begin
    str(e[i],s);
    for j:=4-length(s) downto 1 do s:='0'+s;
    ts:=ts+s;
    end;
for i:=1 to length(ts) do if ts[i]<>'0' then break;
if i-1>0 then delete(ts,1,i-1);
mul:=ts;
end;
procedure print(n:longint);
begin
writeln(n);
close(input);
close(output);
halt;
end;
begin
assign(input,'magic.in');
reset(input);
assign(output,'magic.out');
rewrite(output);
readln(n);
if n=1 then begin writeln(0);close(input);close(output);halt; end;
str(n,s);
old:=1; ne:=1; a[1]:=1; hash[1]:=1;
while old<=ne do
 begin
 for i:=1 to 3 do
     begin
     case i of
     1:begin
       if a[old]=1 then continue;
       if hash[a[old]-1]=0 then
          begin
             inc(ne);
             hash[a[old]-1]:=1;
             a[ne]:=a[old]-1;
             sum[ne]:=sum[old]+1;
             if a[old]-1=n then
             print(sum[ne]);
          end;
       end;
     2:begin
       if a[old]+1>n then continue;
       if a[old]+1>2*n then continue;
       if hash[a[old]+1]=0 then
          begin
          inc(ne);
          hash[a[old]+1]:=1;
          a[ne]:=a[old]+1;
          sum[ne]:=sum[old]+1;
          if a[old]+1=n then
          print(sum[ne]);
          end;
       end;
     3:begin
       j:=2;
       str(a[old],ts);
       if a[old]=1 then continue;
       if length(ts)>length(s) then
          continue;
       if (length(ts)=length(s))and(ts>s) then
          continue;
       del1:=gj(s,ts);
       us:=ts;
       while true do
        begin
        res:=mul(ts,us);
        if ((length(res)=length(s))and(res>s))or(length(res)>length(s)) then
           begin
           del2:=gj(res,s);
           if (length(del1)=length(del2))and(del1<=del2) then break;
           if length(del1)<length(del2) then break;
           end;
        val(res,now,code);
        if hash[now]=0 then
           begin
           inc(ne);
           a[ne]:=now;
           sum[ne]:=sum[old]+1;
           hash[now]:=1;
           end;
        ts:=res;
        if now=n then
           print(sum[ne]);
        inc(j);
        end;
       end;
     end;
     end;
 inc(old);
 end;
close(input);
close(output);
end.
