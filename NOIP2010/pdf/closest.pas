var i,t,p,t1,t2,n,last,next:longint;
    a,b,ind,pre,nex,ans,now:array[1..100]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                y:=ind[i];
                ind[i]:=ind[j];
                ind[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
assign(input,'closest.in');
reset(input);
assign(output,'closest.out');
rewrite(output);
readln(n);
for i:=1 to n do begin read(a[i]); ind[i]:=i; end;
b:=a;
sort(1,n);
for i:=1 to n do
    begin
    pre[i]:=i-1; nex[i]:=i+1;
    t:=a[i];
    now[ind[i]]:=i;
    end;
ans[1]:=0;
for i:=n downto 2 do
    begin
    t:=now[i];
    p:=nex[t];
    t1:=0; t2:=0;
    while (p<n+1) do
      begin
      if ind[p]<i then
         begin
         t1:=a[p];
         break;
         end;
      p:=nex[p];
      end;
    p:=pre[t];
    while (p>0) do
      begin
      if ind[p]<i then
         begin
         t2:=a[p];
         break;
         end;
      p:=pre[p];
      end;
    if (t2=0) then ans[i]:=abs(t1-b[i])
       else if (t1=0) then ans[i]:=abs(t2-b[i])
            else begin
                 if abs(t1-b[i])<abs(t2-b[i]) then ans[i]:=abs(t1-b[i])
                    else ans[i]:=abs(t2-b[i]);
                 end;
    last:=pre[t];
    next:=nex[t];
    nex[last]:=next;
    pre[next]:=last;
    end;
for i:=1 to n do writeln(i,':',ans[i]);
close(input);
close(output);
end.