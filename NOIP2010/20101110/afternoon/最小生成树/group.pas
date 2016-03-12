type rec=array[1..3]of longint;
var n,m,p,q,a,b,c,i,tot,j,t1,t2,ans:longint;
   father,hash,res:array[1..1000000]of longint;
   edge,que:array[1..1000000]of rec;
function getfather(x:longint):longint;
begin
if father[x]=x then exit(x);
father[x]:=getfather(father[x]);
exit(father[x]);
end;
procedure sort(l,r: longint);
      var
         i,j,x: longint;
         y:rec;

      begin
         i:=l;
         j:=r;
         x:=edge[(l+r) div 2,3];
         repeat
           while edge[i,3]>x do
            inc(i);
           while x>edge[j,3] do
            dec(j);
           if not(i>j) then
             begin
                y:=edge[i];
                edge[i]:=edge[j];
                edge[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
procedure work;
var i:longint;
begin
for i:=1 to q do
    begin
    if hash[i]=1 then continue;
    t1:=getfather(que[i,1]);
    t2:=getfather(que[i,2]);
    if (t1=t2) then
       begin
       hash[i]:=1;
       res[i]:=c;
       end;
    end;
end;
begin
assign(input,'group.in');
reset(input);
assign(output,'group.out');
rewrite(output);
readln(n,m,q,p);
for i:=1 to m do
    begin
    readln(a,b,c);
    inc(tot);
    edge[tot,1]:=a;
    edge[tot,2]:=b;
    edge[tot,3]:=c;
    end;
for i:=1 to q do
    begin
    readln(a,b);
    que[i,1]:=a;
    que[i,2]:=b;
    end;
sort(1,tot);
for i:=1 to n do father[i]:=i;
i:=1; j:=1;
while (i<=tot)and(j<=tot) do
  begin
  a:=edge[j,1]; b:=edge[j,2];
  c:=edge[j,3];
  t1:=getfather(a); t2:=getfather(b);
  if t1<>t2 then
     begin

     father[t2]:=t1;
      work;
     inc(i);
     end;
  inc(j);
  end;
ans:=1;
for i:=1 to q do
    begin
    ans:=ans*res[i] mod p;
    end;
writeln(ans);
close(input);
close(output);
end.
