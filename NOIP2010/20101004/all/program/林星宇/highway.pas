var a:array[1..100000]of 0..1000;
    ans,k,n,m,i,j,s,t,d,si:longint;
    flag:boolean;
begin
assign(input,'highway.in');reset(input);
assign(output,'highway.out');rewrite(output);
 readln(n,m,i);
 for k:=1 to n do a[k]:=i;
for k:=1 to m do
 begin
 flag:=true;
  readln(si,s,t,d);
  if si=1 then
  begin
   for j:=s to t do if a[j]<d then begin flag:=false;break;end;
    if flag then
    begin
     for j:=s to t do dec(a[j],d);
     inc(ans);
    end;
  end;
  if si=2 then for j:=s to t do a[j]:=(a[j]+d)mod 1001;
  if si=3 then for j:=s to t do if (a[j]<d)and(a[j]<>0) then a[j]:=d;
  end;
writeln(ans);
close(input);
close(output);
end.