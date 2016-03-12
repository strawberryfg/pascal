const maxn=10000200;
var i,j,k,now,t,sum,n:longint;
    f,hash:array[1..maxn]of longint;
    spe:array[0..256]of longint;
    c:char;
    h:string;
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
begin
assign(input,'tel.in');
reset(input);
assign(output,'tel.out');
rewrite(output);
    for j:=2 to 6 do
        begin
        for k:=1 to 3 do
            begin
            t:=64+(j-2)*3+k;
            spe[t]:=j;
            end;
        end;
    spe[80]:=7; spe[82]:=7; spe[83]:=7;
    for j:=84 to 86 do spe[j]:=8;
    for j:=87 to 89 do spe[j]:=9;
readln(n);
for i:=1 to n do
    begin
    now:=0;
    while not eoln do
        begin
        read(c);
        if c<>'-' then
           begin
           if (ord(c)>=48)and(ord(c)<=57) then
              now:=now*10+(ord(c)-48)
           else
              begin
              t:=spe[ord(c)];
              now:=now*10+t;
              end;
           end;
        end;
    readln;
    inc(hash[now]);
    if hash[now]=2 then
       begin
       inc(sum);
       f[sum]:=now;
       end;
    end;
if sum<>0 then sort(1,sum);
for i:=1 to sum do
    begin
    str(f[i] div 10000,h);
    for j:=1 to 3-length(h) do write('0');
    write(f[i] div 10000,'-');
    str(f[i] mod 10000,h);
    for j:=1 to 4-length(h) do write('0');
    write(f[i] mod 10000,' ',hash[f[i]]);
    writeln;
    end;
if sum=0 then writeln('No duplicates.');
close(input);
close(output);
end.