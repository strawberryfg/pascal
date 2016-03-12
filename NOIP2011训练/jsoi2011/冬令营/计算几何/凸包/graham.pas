uses math;
var n,i,j,t,minx,miny,maxx,maxy,minnum:longint;
    x,y,stack:array[0..100]of longint;
    ans:array[0..100]of extended;
procedure sort(l,r: longint);
      var
         i,j,temp: longint;
         mid,tt:extended;
      begin
         i:=l;
         j:=r;
         mid:=ans[(l+r) div 2];
         repeat
           while ans[i]<mid do
            inc(i);
           while mid<ans[j] do
            dec(j);
           if not(i>j) then
             begin
                tt:=ans[i];
                ans[i]:=ans[j];
                ans[j]:=tt;
                temp:=x[i];
                x[i]:=x[j];
                x[j]:=temp;
                temp:=y[i];
                y[i]:=y[j];
                y[j]:=temp;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function multi(px,py,pz:longint):boolean;
var k:longint;
begin
k:=(x[py]-x[px])*(y[pz]-y[py])-(x[pz]-x[py])*(y[py]-y[px]);
if k<0 then exit(true) else exit(false);
end;
function angle(p:longint):extended;
var j,k,m,n:extended;
begin
j:=(x[p]-x[1]);
k:=(y[p]-y[1]);
m:=sqrt(j*j+k*k);
n:=arccos(j/m);
exit(n);
end;
procedure swap(a,b:longint);
var t:longint;
    tt:extended;
begin
t:=x[a]; x[a]:=x[b]; x[b]:=t;
t:=y[a]; y[a]:=y[b]; y[b]:=t;
tt:=ans[a]; ans[a]:=ans[b]; ans[b]:=tt;
end;
begin
assign(input,'graham.in');
reset(input);
{assign(output,'graham.out');
rewrite(output);}
readln(n);
miny:=maxlongint; minx:=maxlongint;
for i:=1 to n do
    begin
    readln(x[i],y[i]);
    if y[i]<miny then begin minnum:=i; miny:=y[i];end
       else begin
            if (y[i]=miny)and(x[i]<minx) then
               begin
               minx:=x[i];
               minnum:=i;
               end;
            end;
    end;
swap(minnum,1);
for i:=2 to n do
    begin
    ans[i]:=angle(i);
    end;
sort(2,n);
x[n+1]:=x[1]; y[n+1]:=y[1];
stack[1]:=1; stack[2]:=2;
t:=2;
i:=3;
while (i<=n) do
   begin
   while (multi(stack[t-1],stack[t],i))and(t>=1) do
      dec(t);
   inc(t);
   stack[t]:=i;
   inc(i);
   end;
for j:=1 to t do
    begin
    writeln(' x: ',x[stack[j]],' y: ',y[stack[j]]);
    end;
close(input);
close(output);
end.