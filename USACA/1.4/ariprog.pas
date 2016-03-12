{
ID: xiaweiy1
PROB:ariprog
LANG:PASCAL
}
var n,m,i,j,k,tot,sum,gongcha,v,st,en,s,cha,max:longint;
    pd:boolean;
    ts:string;
    a,b,p,q:array[0..125000]of longint;
    u:array[0..125000]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=q[(l+r) div 2];
         repeat
           while q[i]<x do
            inc(i);
           while x<q[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=q[i];
                q[i]:=q[j];
                q[j]:=y;
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
assign(input,'ariprog.in');
reset(input);
assign(output,'ariprog.out');
rewrite(output);
readln(n);
readln(m);
for i:=0 to m do
    for j:=0 to i do
        begin
        k:=i*i+j*j;
        if p[k]=0 then begin inc(tot);p[k]:=1;q[tot]:=k; end;
        end;
sort(1,tot);
max:=2*m*m;
for i:=1 to tot+1-n do
    begin
    for j:=i+1 to tot do
        begin
        cha:=q[j]-q[i];
        s:=1;
        if u[i]<>cha then
        begin
        k:=q[j]+cha;
        while k<=max do
              if p[k]=0 then begin u[j]:=cha;
                                   break;
                             end
                        else begin inc(s);k:=k+cha; end;
        end
        else if p[q[j]+cha]=1 then  u[q[j]+cha]:=cha;
        if s+1<n then u[j]:=cha
                 else begin
                      for k:=i to i+s+1-n do
                          begin inc(sum);a[sum]:=q[i]+cha*(k-i);b[sum]:=cha;
                          for m:=1 to sum-1 do if (a[sum]=a[m])and(b[sum]=b[m]) then
                              begin a[sum]:=0;b[sum]:=0;dec(sum);break; end;
                          end;
                      u[j]:=cha;
                      end;
        end;
    end;
for i:=1 to sum-1 do
    for j:=i+1 to sum do
        begin
        if b[i]>b[j] then begin b[i]:=b[i]+b[j]; b[j]:=b[i]-b[j]; b[i]:=b[i]-b[j];
                                a[i]:=a[i]+a[j]; a[j]:=a[i]-a[j]; a[i]:=a[i]-a[j];
                          end;
        end;
st:=1;
while st<sum do
      begin
      for i:=st+1 to sum+1 do if b[st]<>b[i] then begin en:=i-1;break; end;
      for i:=st to en-1 do
          for j:=i+1 to en do
              if a[i]>a[j] then begin a[i]:=a[i]+a[j];a[j]:=a[i]-a[j];a[i]:=a[i]-a[j]; end;
      st:=en+1;
      end;
if sum=0 then writeln('NONE')
         else for i:=1 to sum do begin write(a[i],' ',b[i]); writeln; end;
close(input);
close(output);
end.
