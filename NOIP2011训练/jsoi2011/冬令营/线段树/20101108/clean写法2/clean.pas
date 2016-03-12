type rec=record
     l,r,mid,cov:longint;
     end;
var m:array[1..1000000]of rec;
    n,kind,i,a,b,num:longint;
procedure init(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
m[x].mid:=(f+t)div 2;
if f=t then exit;
init(f,(f+t)div 2,x*2);
init((f+t)div 2+1,t,x*2+1);
end;

function count(x:longint):longint;
var ans:longint;
begin
if m[x].cov=1 then exit(m[x].r-m[x].l+1)
   else begin
        if (m[x].r-m[x].l=0) then
           exit(0)
        else
          begin
          ans:=count(x*2);
          ans:=ans+count(x*2+1);
          exit(ans);
          end;
        end;
end;
procedure insert(f,t,x:longint);
begin
if m[x].cov=0 then
   begin
   if (f=m[x].l)and(t=m[x].r) then m[x].cov:=1
      else begin
           if t<=m[x].mid then insert(f,t,x*2)
              else begin
                   if f>m[x].mid then insert(f,t,x*2+1)
                      else begin
                           insert(f,m[x].mid,x*2);
                           insert(m[x].mid+1,t,x*2+1);
                           end;
                   end;
           end;
   if ((m[x*2].cov=1)and(m[x*2+1].cov=1)) then
      m[x].cov:=1;
   end;
end;
begin
assign(input,'clean.in');
reset(input);
assign(output,'clean.out');
rewrite(output);
readln(n,kind);
init(1,n,1);
for i:=1 to kind do
    begin
    readln(a,b);
    insert(a,b,1);
    end;
num:=count(1);
writeln(n-num);
close(input);
close(output);
end.