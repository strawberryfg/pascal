const spe:array[1..10,0..9]of longint=
      ((0,1,0,0,0,0,0,0,0,0),(0,1,1,0,0,0,0,0,0,0),(0,1,1,1,0,0,0,0,0,0),
       (0,1,1,1,1,0,0,0,0,0),(0,1,1,1,1,1,0,0,0,0),(0,1,1,1,1,1,1,0,0,0),
       (0,1,1,1,1,1,1,1,0,0),(0,1,1,1,1,1,1,1,1,0),(0,1,1,1,1,1,1,1,1,1),
       (1,2,1,1,1,1,1,1,1,1));
var n,i,j,k,p,t:longint;
    f:array[0..9]of longint;
    kk:array[1..9]of longint;
    ts:string;
begin
{assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);}
readln(n);
if n<=10 then begin for i:=0 to 9 do writeln(spe[n,i]); close(input);close(output);halt; end;
str(n,ts);
t:=length(ts);
kk[t]:=1;
for i:=t-1 downto 1 do kk[i]:=kk[i+1]*10;
k:=n div 10; dec(k);
for i:=0 to 9 do inc(f[i],k);
for i:=1 to 9 do inc(f[i]);
k:=n mod 10;
for i:=0 to k do inc(f[i]);
for i:=t-1 downto 2 do
    begin
    k:=n div kk[i-1];
    dec(k);
    for j:=0 to 9 do inc(f[j],k*kk[i]);
    for j:=1 to 9 do inc(f[j],kk[i]);
    k:=n mod kk[i-1] div kk[i];
    p:=k;
    dec(k);
    for j:=0 to k do inc(f[j],kk[i]);
    k:=n mod kk[i-1] mod kk[i];
    for j:=0 to k do inc(f[p]);
    end;
k:=n div kk[1]-1;
for i:=1 to k do inc(f[i],kk[1]);
k:=n mod kk[1];
p:=n div kk[1];
inc(f[p],k+1);
for i:=0 to 9 do writeln(f[i]);
close(input);
close(output);
end.
