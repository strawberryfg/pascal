const maxn=100000;
type rec=record
     l,r,sum:longint;
     end;
var m:array[1..maxn*12]of rec;
    i,n,min,k1,k,delta,ans:longint;
    ch:char;
procedure init(f,t,x:longint);
var mid:longint;
begin
m[x].l:=f; m[x].r:=t; m[x].sum:=0;
if f=t then exit;
mid:=(f+t+maxn*2)div 2-maxn;                     
init(f,mid,x*2);
init(mid+1,t,x*2+1);
end;
procedure  add(k,x:longint);
var mid:longint;
begin
if  m[x].l=m[x].r then
   begin
   inc(m[x].sum);                    //m[x].sum表示工资值为x的人的个数
   exit;
   end;
if m[x].sum=0 then                   //如果m[x].sum那它的左右节点的m[].sum也是0
   begin                                  
   m[x*2].sum:=0; m[x*2+1].sum:=0;
   end;
inc(m[x].sum);                     
mid:=(m[x].l+m[x].r+maxn*2)div 2-maxn;
if k>mid then add(k,2*x+1)
   else add(k,2*x);
end;
procedure update(x:longint);
begin
if m[x].r+delta<min then
   begin
   inc(ans,m[x].sum);
   m[x].sum:=0;
   exit;
   end;
if (m[x*2].l+delta<min)and(m[x*2].sum<>0) then
  update(x*2);
if (m[x*2+1].l+delta<min)and(m[x*2+1].sum<>0) then
  update(x*2+1);
m[x].sum:=m[x*2].sum+m[x*2+1].sum;                               //会把某一个m[x].sum改成0 所以要民主集中
end;
function getnum(k,x:longint):longint;
begin
if m[x].l=m[x].r then exit(m[x].l)
   else begin
        if m[x*2+1].sum>=k then getnum:=getnum(k,x*2+1)
                          else getnum:=getnum(k-m[x*2+1].sum,x*2);

        end;
end;
begin
assign(input,'cashier.in');
reset(input);
assign(output,'cashier.out');
rewrite(output);
readln(n,min);
ans:=0;
init(-maxn,maxn*2,1);
for i:=1 to n do
    begin
    read(ch);    read(k);
    readln;
    case ch of
     'I':begin
         if k<min then continue;
         k1:=k-delta;
         add(k1,1);
         end;
     'A':begin
         inc(delta,k);
         end;
     'S':begin
         dec(delta,k);
         update(1);
         end;
     'F':begin
         if k>m[1].sum then writeln(-1) else writeln(getnum(k,1)+delta);
         end;
     end;
    end;
writeln(ans);
close(input);
close(output);
end.
