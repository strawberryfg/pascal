{
ID: xiaweiy1
PROG: contact
LANG: PASCAL
}
const two:array[0..14]of longint=(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384);
      maxn=300000;
type rec=array[1..3]of longint;
var a,b,n,tot,i,j,k,t,done,tmp,total,now:longint;
    hash:array[0..4097,1..13]of longint;
    f:array[1..maxn]of char;
    s:string;
    g:array[1..maxn]of rec;
    tt:char;
function calc(st,en:longint):longint;
var sum,i,res:longint;
begin
sum:=-1;
res:=0;
for i:=en downto st do
    begin
    inc(sum);
    res:=res+two[sum]*(ord(f[i])-ord('0'));
    end;
exit(res);
end;
procedure sort(l,r: longint);
      var
         i,j,x,p,q: longint;
         y:rec;
      begin
         i:=l;
         j:=r;
         x:=g[(l+r) div 2,1];
         p:=g[(l+r) div 2,2];
         q:=g[(l+r) div 2,3];
         repeat
           while (g[i,1]>x)or((g[i,1]=x)and(g[i,2]<p))or((g[i,1]=x)and(g[i,2]=p)and(g[i,3]<q)) do
            inc(i);
           while (x>g[j,1])or((x=g[j,1])and(p<g[j,2]))or((g[j,1]=x)and(p=g[j,2])and(q<g[j,3])) do
            dec(j);
           if not(i>j) then
             begin
                y:=g[i];
                g[i]:=g[j];
                g[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function getit(len,x:longint):string;
var t,p,i:longint;
    s:string;
begin
s:='';
p:=x;
while p>1 do
 begin
 t:=p mod 2;
 s:=char(t+48)+s;
 p:=p div 2;
 end;
if p=1 then s:='1'+s;
for i:=1 to len-length(s) do s:='0'+s;
exit(s);
end;
begin
assign(input,'contact.in');
reset(input);
assign(output,'contact.out');
rewrite(output);
readln(a,b,n);
while not eof do
  begin
  read(tt);
  if (ord(tt)=48)or(ord(tt)=49) then
     begin
     inc(tot);
     f[tot]:=tt;
     end;
  end;
for i:=1 to tot+1-a do
    begin
    for j:=a to b do
        begin
        t:=i+j-1;
        if t<=tot then
           begin
           tmp:=calc(i,t);
           inc(hash[tmp,j]);
           end;
        end;
    end;
total:=0;
for i:=0 to two[b] do
    begin
    for j:=a to b do
        begin
        if hash[i,j]<>0 then
           begin
           inc(total);
           g[total,1]:=hash[i,j];  //frequency
           g[total,2]:=j;          //length
           g[total,3]:=i;          //number
           end;
        end;
    end;
sort(1,total);
done:=0;
i:=1;
while i<=total do
  begin
  tmp:=g[i,1];
  j:=i;
  while (j+1<=total)and(g[j+1,1]=tmp)do inc(j);
  writeln(tmp);
  now:=0;
  for k:=i to j do
      begin
      inc(now);
      s:=getit(g[k,2],g[k,3]);
      if now mod 6=0 then
         begin
         write(s);
         if k<>j then writeln;
         end
      else
         begin
         if k<>j then write(s,' ') else write(s);
         end;
      end;
  writeln;
  inc(done);
  if done=n then break;
  i:=j+1;
  end;
close(input);
close(output);
end.
