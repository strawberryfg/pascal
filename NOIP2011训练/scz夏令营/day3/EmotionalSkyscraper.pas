//21:35   //22:00;
const maxn=320;
type arr=array[-1..200]of longint;
var a:array[1..maxn]of longint;
    f,sumf,sumg:array[0..maxn]of arr;
    sum,res,c:arr;
    n,i,j,k:longint;
function add(x,y:arr):arr;
var max,i,a,b:longint;
begin
fillchar(c,sizeof(c),0);
if x[-1]>y[-1] then max:=x[-1] else max:=y[-1];
for i:=0 to max do
    begin
    c[i]:=c[i]+x[i]+y[i];
    c[i+1]:=c[i+1]+c[i] div 10000;
    c[i]:=c[i] mod 10000;
    end;
if c[max+1]<>0 then inc(max);
c[-1]:=max;
exit(c);
end;
procedure print(x:arr);
var i:longint;
begin
write(x[x[-1]]);
for i:=x[-1]-1 downto 0 do
    begin
    if x[i]>999 then write(x[i])
       else if x[i]>99 then write('0',x[i])
            else if x[i]>9 then write('00',x[i])
                 else write('000',x[i]);
    end;
writeln;
end;
begin
assign(input,'EmotionalSkyscraper.in');
reset(input);
assign(output,'EmotionalSkyscraper.out');
rewrite(output);
readln(n);
for i:=1 to n-1 do read(a[i]);
f[1,0]:=1;
sumf[1,0]:=1; sumf[1,0]:=1;
for i:=2 to n do
    begin

    for j:=1 to i do
        begin
        if a[i-1]=1 then   // h[i]<h[i+1]
           begin
           {for k:=0 to sum[-1] do sum[k]:=0;
           sum[-1]:=0;
           for k:=1 to j-1 do
               sum:=add(sum,f[i-1,k]);
           f[i,j]:=sum;            }

           //f[i,j]:=sumf[i-1,j-1];
           f[j]:=sumf[j-1];
           end
        else
           begin
           {for k:=0 to sum[-1] do sum[k]:=0;
           sum[-1]:=0;
           for k:=j to i-1 do
               begin
               sum:=add(sum,f[i-1,k]);
               end;
           f[i,j]:=sum; }

           //f[i,j]:=sumg[i-1,j];
           f[j]:=sumg[j];
           end;
        if i=n then res:=add(res,f[j]);
        end;
    for j:=1 to n do
        begin
        //sumf[i,j]:=add(sumf[i,j-1],f[i,j]);
        sumf[j]:=add(sumf[j-1],f[j]);
        end;
    for j:=i downto 1 do
        begin
        //sumg[i,j]:=add(sumg[i,j+1],f[i,j]);
        sumg[j]:=add(sumg[j+1],f[j]);
        end;
    end;
print(res);
close(input);
close(output);
end.
