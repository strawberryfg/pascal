{
ID: xiaweiy1
PROG: zerosum
LANG: PASCAL
}
const ten:array[0..9]of longint=(1,10,100,1000,10000,100000,1000000,10000000,
                                 100000000,1000000000);
var i,j,k,n,tot:longint;
    a:array[1..9]of integer;
    f:array[1..100]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=f[(l+r) div 2];
         repeat
           while f[i]<x do
            inc(i);
           while x<f[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=f[i];
                f[i]:=f[j];
                f[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function check(num:longint):boolean;
var i,t,k,v,pre,sum:longint;
begin
t:=0;
v:=num;
sum:=0;
pre:=0;
for i:=1 to n-1 do
    begin
    t:=t*10+i;
    k:=v div ten[n-i-1];
    v:=v mod ten[n-i-1];
    if (k=2)or(k=3) then
    begin
     if (pre=2)or(pre=0) then begin inc(sum,t); t:=0; pre:=k; end;
     if pre=3 then begin dec(sum,t); t:=0; pre:=k; end;
    end;
    if i=n-1 then
       begin
       if k=1 then t:=t*10+n else t:=n;
       end;
    end;
if pre=0 then inc(sum,t) else if pre=2 then inc(sum,t) else dec(sum,t);
if sum=0 then exit(true) else exit(false);
end;
procedure work(dep,x:longint);
var i,v:longint;
begin
v:=x;
for i:=1 to 3 do
    begin
    case i of
    1:begin v:=x; v:=v*10+1; end;
    2:begin v:=x; v:=v*10+2; end;
    3:begin v:=x; v:=v*10+3; end;
    end;
    if (dep=n-1) then
       begin
       if check(v)=true then
          begin
          inc(tot);
          f[tot]:=v;
          end;
       end
       else
       work(dep+1,v);
    end;
end;
begin
assign(input,'zerosum.in');
reset(input);
assign(output,'zerosum.out');
rewrite(output);
readln(n);
for i:=1 to n do a[i]:=i;
work(1,0);
sort(1,tot);
for i:=1 to tot do
    begin
    for j:=1 to n-1 do
        begin
        write(j);
        k:=f[i] div ten[n-j-1];
        f[i]:=f[i] mod ten[n-j-1];
        if k=1 then write(' ')else if k=2 then write('+') else write('-');
        end;
    write(n);
    writeln;
    end;
close(input);
close(output);
end.
