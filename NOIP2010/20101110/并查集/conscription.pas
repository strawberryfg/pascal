var handle,n,m,r,x,y,d,tot,k,sum,i,j,a,b,t1,t2:longint;
    edge:array[1..9000000,1..3]of longint;
    father,fhash:array[0..200000]of longint;
    ans:int64;
procedure sort(l,r: longint);
      var
         i,j,x: longint;
         y:array[1..3]of longint;
      begin
         i:=l;
         j:=r;
         x:=edge[(l+r) div 2,3];
         repeat
           while edge[i,3]<x do
            inc(i);
           while x<edge[j,3] do
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
function find(num:longint):longint;
var t:longint;
begin
if father[num]=num then exit(num);
father[num]:=find(father[num]);
exit(father[num]);
end;
begin
assign(input,'conscription.in');
reset(input);
assign(output,'conscription.out');
rewrite(output);
readln(n,m,r);     //0-n-1
for i:=1 to  r do
    begin
    readln(x,y,d);
    inc(tot);
    edge[tot,1]:=x;
    edge[tot,2]:=y+n;
    edge[tot,3]:=10000-d;
    end;
for i:=1 to n+m do
    begin
    inc(tot);
    edge[tot,1]:=0;
    edge[tot,2]:=i;
    edge[tot,3]:=10000;
    end;
sort(1,tot);
sum:=n+m;
i:=1; j:=1;
for k:=0 to n+m do father[k]:=k;
while (i<=tot)and(j<sum) do
  begin
  a:=edge[i,1]; b:=edge[i,2];
  t1:=find(a); t2:=find(b);

  if t2<>t1 then
     begin

     father[t2]:=t1;
     ans:=int64(ans)+int64(edge[i,3]);
     inc(j);
     end;
  inc(i);
  end;
writeln(ans+10000);
close(input);
close(output);
end.
