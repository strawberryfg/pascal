type arr=array[1..100]of longint;
var n,js,i,total,k,h,j:longint;
        tou,wei,number:array[1..100]of longint;
        a:array[1..100]of arr;
function min(a,b:longint):longint;
begin
if a>b then min:=b
        else min:=a;
end;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
read(n);
for i:=1 to n do
        readln(tou[i],wei[i]);
js:=0;

for i:=1 to n do
         begin
         //a[i][1]:=tou[i];
         //a[i][wei[i]-tou[i]+1]:=wei[i];
         while js<>wei[i]-tou[i]+1 do
                begin
                inc(js);
                a[i][js]:=tou[i]+js-1
                end;
         number[i]:=js;
         js:=0;
         end;
for i:=1 to n do
       total:=total+number[i];
for i:=1 to n-1 do
        for j:=i+1 to n do
                for k:=1 to number[i] do
                        for h:=1 to number[j] do
                                if a[j][h]=a[i][k] then total:=total-min(number[i],number[j]);

writeln(total);
close(input);
close(output);
end.
