const maxn=2020;
var n,i,j,fmin:longint;
    a,h:array[1..maxn]of longint;
    opt:array[0..maxn,0..maxn]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=h[(l+r) div 2];
         repeat
           while h[i]<x do
            inc(i);
           while x<h[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=h[i];
                h[i]:=h[j];
                h[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
begin
assign(input,'bread.in');
reset(input);
assign(output,'bread.out');
rewrite(output);
readln(n);
for i:=1 to n do readln(a[i]);
h:=a;
sort(1,n);
fmin:=maxlongint;
for i:=1 to n do
    begin
    opt[i,0]:=maxlongint;
    for j:=1 to n do
        begin
        opt[i,j]:=opt[i,j-1];
        opt[i,j]:=min(opt[i,j],opt[i-1,j]+abs(a[i]-h[j]));
        if (i=n) then fmin:=min(fmin,opt[i,j]);
        end;
    end;
//writeln(fmin);
for i:=1 to n do
    begin
    opt[i,n+1]:=maxlongint;
    for j:=n downto 1 do
        begin
        opt[i,j]:=opt[i,j+1];
        opt[i,j]:=min(opt[i,j],opt[i-1,j]+abs(a[i]-h[j]));
        if (i=n) then fmin:=min(fmin,opt[i,j]);
        end;
    end;
writeln(fmin);
close(input);
close(output);
end.