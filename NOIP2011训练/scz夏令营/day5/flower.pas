type arr=array[-1..100]of longint;
var a:array[1..120000]of boolean;
    prime:array[1..120000]of longint;
    sum,i,t,max:longint;
    ans,res,tmp,c:arr;
    ts,ss:string;
procedure eratos;

    var
       i,j : longint;

    begin
       a[1]:=false;
       for i:=2 to max do
         a[i]:=true;
       for i:=2 to max div 2 do
         if a[i] then
           for j:=2 to max div i do
             a[i*j]:=false;

       for i:=1 to max do
        begin
          if a[i] then
           begin
            inc(sum);
            prime[sum]:=i;
           end;
        end;
    end;
function mul(x,y:arr):arr;
var i,j,k:longint;
begin
fillchar(c,sizeof(c),0);
if x[-1]>max then max:=x[-1] else max:=y[-1];
for i:=0 to x[-1] do
    begin
    for j:=0 to y[-1] do
        begin
        c[i+j]:=c[i+j]+x[i]*y[j];
        k:=i+j;
        while c[k]>=10000 do
         begin
         if k>max then max:=k;
         c[k+1]:=c[k+1]+c[k] div 10000;
         c[k]:=c[k] mod 10000;
         inc(k);
         end;
        end;
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
function get(x:arr):string;
var i:longint;
    s,tt:string;
begin
s:='';
str(x[x[-1]],s);
for i:=x[-1]-1 downto 0 do
    begin
    str(x[i],tt);
    if x[i]>999 then begin   s:=s+tt; end
       else if x[i]>99 then begin s:=s+'0'+tt; end
            else if x[i]>9 then s:=s+'00'+tt
                 else s:=s+'000'+tt;
    end;
exit(s);
end;
begin
assign(input,'flower.in');
reset(input);
assign(output,'flower.out');
rewrite(output);
readln(ss);
max:=100020;
eratos;
ans[-1]:=0; ans[0]:=1;
for i:=1 to sum do
    begin
    t:=prime[i];
    res[-1]:=-1;
    while t>=10000 do
     begin
     inc(res[-1]);
     res[res[-1]]:=t mod 10000;
     t:=t div 10000;
     end;
    if t<>0 then begin inc(res[-1]);res[res[-1]]:=t; end;
    tmp:=mul(ans,res);
    ts:=get(tmp);
    if (length(ts)>length(ss))or((length(ts)=length(ss))and(ts>ss)) then break;
    ans:=tmp;
    end;
print(ans);
close(input);
close(output);
end.