var c:char;
    n,num,t,i,j,tt:longint;
    sum,now,res:int64;
    f:array[1..100000,0..1000]of longint;
    spe:array[0..1000]of longint;
//20:48
function pd(a,b:longint):boolean;   //true a<b
var i:longint;
begin
if f[a,0]<f[b,0] then exit(true);
if f[a,0]>f[b,0] then exit(false);
for i:=1 to f[a,0] do
    begin
    if f[a,i]<f[b,i] then exit(true);
    if f[a,i]>f[b,i] then exit(false);
    end;
exit(false);
end;
procedure swap(a,b:longint);
var t:array[0..1000]of longint;
begin
t:=f[a]; f[a]:=f[b]; f[b]:=t;
end;
procedure gj;
var t:array[0..1000]of longint;
    i:longint;
begin
for i:=1 to f[1,0] do t[i+1]:=f[1,i];
t[0]:=f[1,0];
t[f[1,0]+1]:=t[f[1,0]+1]+1;
for i:=f[1,0]+1 downto 2 do
    begin
    if t[i] div 10>=1 then
       begin
       t[i-1]:=t[i-1]+t[i] div 10;
       t[i]:=t[i] mod 10;
       end
    else break;
    end;
if t[1]=0 then
   begin
   for i:=1 to f[1,0] do f[1,i]:=t[i+1];
   end
else begin for i:=1 to f[1,0]+1 do f[1,i]:=t[i];f[1,0]:=f[1,0]+1; end;
end;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=(l+r)div 2;
         repeat
           while pd(i,x) do
            inc(i);
           while pd(x,j) do
            dec(j);
           if not(i>j) then
             begin
                swap(i,j);
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
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    sum:=0;
    read(c);
    if i=n then
        tt:=1;
    while (c<>' ')and(not eoln)and(not eof) do
      begin
       inc(sum);
       f[i,0]:=sum;
       f[i,sum]:=ord(c)-ord('0');
       read(c);
      end;
    end;
spe[0]:=1;
for i:=1 to 32 do
    begin
    spe[i]:=spe[i-1]*10 mod 999983;
    end;
sort(1,n);
gj;
sum:=1;
now:=1;
for i:=1 to n do
    begin
    num:=0;
    for j:=1 to f[i,0] do
        begin
        t:=f[i,0]-j;
        res:=int64(f[i,j])*int64(spe[t]);
        res:=res mod 999983;
        inc(num,res);
        end;
    sum:=int64(sum)*int64(num);
    sum:=sum mod 999983;
    end;
writeln(sum);
close(input);
close(output);
end.
