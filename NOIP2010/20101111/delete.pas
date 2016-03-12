var i,x,y,z,tot,n,ans,nowx,nowy,fmax:longint;
    now,from,value:array[1..1000000]of longint;
    edge:array[1..25000000,1..3]of longint;
    f,link:array[0..5000,0..5000]of longint;
    hash:array[0..7000]of integer;
function work(a,b,cho:longint):longint;
var tail,head,nowmax,num,i,s,t:longint;
begin
tail:=1; head:=1;
now[1]:=a; from[1]:=0; value[1]:=0;
fillchar(hash,sizeof(hash),0);
hash[a]:=1;
nowmax:=0; num:=0;
while (tail<=head) do
  begin
  s:=now[tail];
  for i:=1 to link[s,0] do
      begin
      t:=link[s,i];
      if hash[t]=1 then continue;
      if (t<>b)and(t<>from[tail]) then
         begin
         hash[t]:=1;
         inc(head);
         now[head]:=t;
         from[head]:=s;
         value[head]:=value[tail]+f[s,t];
         if value[head]>nowmax then
            begin
            nowmax:=value[head];
            num:=now[head];
            end;
         end;
      end;
  inc(tail);
  end;
if cho=1 then exit(work(num,b,2))
   else exit(nowmax);
end;
begin
assign(input,'delete.in');
reset(input);
assign(output,'delete.out');
rewrite(output);
readln(n);
for i:=1 to n-1 do
    begin
    readln(x,y,z);
    inc(tot);
    edge[tot,1]:=x;
    edge[tot,2]:=y;
    edge[tot,3]:=z;
    inc(link[x,0]);
    link[x,link[x,0]]:=y;
    inc(link[y,0]);
    link[y,link[y,0]]:=x;
    f[x,y]:=z;
    f[y,x]:=z;
    end;
for i:=1 to tot do
    begin
    nowx:=edge[i,1]; nowy:=edge[i,2];
    ans:=work(nowx,nowy,1)+work(nowy,nowx,1);
    if ans>fmax then fmax:=ans;
    end;
writeln(fmax);
close(input);
close(output);
end.
