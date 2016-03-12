//20:51; 21:25;
const maxn=200;
type rec=array[1..2]of extended;
var n,u,v,x1,x2,y1,tot,i,j:longint;
    fmin,fmax,sum,t,le,last,x0,y0,maxy:extended;
    a:array[1..maxn]of rec;
    x,y:array[1..maxn,1..4]of extended;
function max(x,y:extended):extended;
begin
if x>y then exit(x) else exit(y);
end;
function min(x,y:extended):extended;
begin
if x<y then exit(x) else exit(y);
end;
procedure sort(l,r: longint);
      var
         i,j: longint;
         tt:extended;
         tmp:rec;
      begin
         i:=l;
         j:=r;
         tt:=a[(l+r) div 2,1];
         repeat
           while a[i,1]<tt do
            inc(i);
           while tt<a[j,1] do
            dec(j);
           if not(i>j) then
             begin
                tmp:=a[i];
                a[i]:=a[j];
                a[j]:=tmp;
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
assign(input,'wind.in');
reset(input);
assign(output,'wind.out');
rewrite(output);
readln(n,u,v);
for i:=1 to n do
    begin
    for j:=1 to 4 do
        begin
        read(x[i,j],y[i,j]);
        end;
    readln;
    end;
readln(x1,x2,y1);
tot:=0;
for i:=1 to n do
    begin
    fmin:=maxlongint; fmax:=-maxlongint;
    maxy:=-maxlongint;
    for j:=1 to 4 do
        begin
        x0:=x[i,j]; y0:=y[i,j];
        if y0>maxy then maxy:=y0;
        if u=0 then
           begin
           t:=x0;
           end
        else
           begin
           t:=y1+v/u*x0-y0;
           t:=t*u/v;
           end;
        if t>fmax then fmax:=t;
        if t<fmin then fmin:=t;
        end;
    if (fmax<x1)or(fmin>x2) then continue;
    if (maxy<y1) then continue;
    fmin:=max(fmin,x1);
    fmax:=min(fmax,x2);
    inc(tot);
    a[tot,1]:=fmin; a[tot,2]:=fmax;
    end;
if tot<>0 then
   begin
   sort(1,tot);
   le:=a[1,1]; last:=a[1,2];
   sum:=0;
   for i:=2 to tot do
       begin
       if a[i,1]<=last then
          begin
          if a[i,2]>last then last:=a[i,2];
          end
       else
          begin
          sum:=sum+last-le;
          le:=a[i,1];
          last:=a[i,2];
          end;
       end;
   sum:=sum+last-le;
   sum:=x2-x1-sum;
   sum:=sum/(x2-x1);
   end
else
   sum:=1;
   writeln(sum*100:0:2,'%');
close(input);
close(output);
end.