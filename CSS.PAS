type arr=array[1..15]of char;
var n,k,t,q,p,s:string;
    i,j,m,new,old:longint;
    code:integer;
    b,e:arr;
    a:array[1..200]of string;
function pd(t,s:string):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to new do
    if s=a[i] then begin pd:=false;break;end;
end;
begin
readln(s);
for i:=1 to length(s) do
    if s[i]=' ' then begin
                     n:=copy(s,1,i-1);
                     k:=copy(s,i+1,length(s)-i);
                     val(k,m,code);
                     break;
                     end;
for i:=1 to m do
    begin
    readln(t);
    b[i]:=t[1];e[i]:=t[3];
    end;
old:=1;
new:=1;
a[1]:=n;
while old<=new do
      begin
      p:=a[old];
      for i:=1 to length(n) do
          begin
          for j:=1 to m do
              begin
              if b[j]=p[i] then begin q:=p;q[i]:=e[j];
              if pd(n,q) then begin inc(new);a[new]:=q;end;end;
              end;
          if i=length(n) then inc(old);
          end;
      end;
writeln(new);
end.