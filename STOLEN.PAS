const maxn=1000;
type arr=array[1..maxn]of longint;
var n,k,i,j,max,weight,value,sum:longint;
    a,w,v:arr;
procedure print;
var i:longint;
begin
for i:=1 to k-sum do
    if a[i]<>0 then begin if weight+w[i]<=n then begin
                                           weight:=weight+w[i];
                                           value:=value+v[i];
                                           end
                                           else break;
                    end;
if value>max then max:=value;
weight:=0;value:=0;
end;
procedure try(dep:longint);
var i:longint;
begin
if dep>k-sum then print
         else for i:=0 to 1 do
                  begin
                  a[dep]:=i;
                  try(dep+1);
                  end;
end;
begin
readln(n,k);
for i:=1 to k do
    readln(w[i],v[i]);
for i:=1 to k do
    if w[i]>n then begin w[i]:=0;v[i]:=0; end;
for i:=1 to k do
    if w[i]=0 then begin inc(sum); for j:=i to k-sum do
                                       begin
                                       w[j]:=w[j+1];
                                       v[j]:=v[j+1];
                                       end;
                   end;
try(1);
writeln(max);
end.
