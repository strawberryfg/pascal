procedure init(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
if f=t then
   begin
   m[x].sum:=v[f];
   end
else 
   begin
   init(f,(f+t)div 2,x*2);
   init((f+t)div 2+1,x*2+1);
   m[x].sum:=m[x*2].sum+m[x*2+1].sum;
   end;
end;
function find(f,t,x:longint):longint;
begin
if lazy[x]<>0 then
   begin
   m[x*2].sum:=m[x*2].sum+lazy[x]*(m[x*2].r-m[x*2].l+1);
   m[x*2+1].sum:=m[x*2+1].sum+lazy[x]*(m[x*2+1].r-m[x*2+1].l+1);
   lazy[x*2]:=lazy[x*2]+lazy[x];
   lazy[x*2+1]:=lazy[x*2+1]+lazy[x];
   lazy[x]:=0;
   end;
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   m[x].sum:=m[x].sum+delta*(m[x].r-m[x].l+1);
   lazy[x]:=delta;
   exit(m[x].sum);
   end
else begin
     ta:=0; tb:=0;
	 if (f<=m[x*2].r) then ta:=find(f,t,x*2);
	 if (f>=m[x*2+1].l) then tb:=find(f,t,x*2+1);
	 m[x].sum:=m[x*2].sum+m[x*2+1].sum;
	 exit(ta+tb);
     end;
end;