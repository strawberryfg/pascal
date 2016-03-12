type rec=record
     l,r,lcnt,rcnt,num:longint;
     end;
var n,i,tot,p,now,last,k:longint;
    a:array[1..100]of rec;
    v:array[1..100]of longint;
procedure dfs(dep:longint);
begin
if a[dep].l<>0 then dfs(a[dep].l);
write(a[dep].num,' ');
if a[dep].r<>0 then dfs(a[dep].r);
end;
begin
assign(input,'bst.in');
reset(input);
readln(n);
for i:=1 to n do
    read(v[i]);
a[1].num:=v[1];
tot:=1;
for i:=2 to n do
    begin
    p:=1;
    now:=v[i];
    while p<>0 do
      begin
      if now<=a[p].num then
         begin
         last:=p;
         if a[p].l<>0 then
            begin
             inc(a[p].lcnt);
            p:=a[p].l;

            end
         else p:=0;
         k:=0;
         end
      else begin
           last:=p;
           if a[p].r<>0 then
              begin
              inc(a[p].rcnt);
              p:=a[p].r;

              end
           else p:=0;
           k:=1;
           end;
      end;
    inc(tot);
    if k=0 then
       begin
       inc(a[last].lcnt);
       a[last].l:=tot
       end
    else
       begin
       inc(a[last].rcnt);
       a[last].r:=tot;
       end;
    a[tot].num:=now;
    end;
dfs(1);
writeln;
for i:=1 to tot do
    begin
    writeln(a[i].num,'   .lcnt=   ',a[i].lcnt);
    writeln('-----','   .rcnt=   ',a[i].rcnt);
    end;
close(input);
end.