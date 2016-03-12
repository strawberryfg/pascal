var s1,s2,s,now,i,j,k,l,b:longint;
    zhi,start,tail,a:array[1..1000]of longint;
function jian(i:longint):boolean;
var j:longint;
begin
jian:=true;
for j:=1 to now do
    begin
    if start[i]<=tail[j] then begin jian:=false;exit;end;
    end;
end;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=tail[(l+r) div 2];
         repeat
           while tail[i]<x do
            inc(i);
           while x<tail[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=tail[i];
                tail[i]:=tail[j];
                tail[j]:=y;
                y:=start[i];
                start[i]:=start[j];
                start[j]:=y;
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
assign(input,'hunger.in');
assign(output,'hunger.out');
reset(input);
rewrite(output);
readln(b);
s1:=0;s2:=0;
for i:=1 to b do
    read(start[i],tail[i]);
sort(1,b);
now:=0;
fillchar(a,sizeof(a),0);
for i:=1 to b do
    begin
    if jian(i) then begin inc(now);a[now]:=i;end;
    end;
for i:=1 to now do
    begin
    s1:=s1+(tail[a[i]]-start[a[i]]+1);
    end;
write(s1);
close(input);
close(output);
end.








