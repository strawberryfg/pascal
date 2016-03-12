var a:array[1..5000000]of longint;
    l,r:array[0..1000000]of longint;
    hash:array[0..10000018]of boolean;
    i,j1,j2,tt,hh,aa,kk,qian,hout,k,t,temp:longint;
    pd:boolean;


function suan(a,b:longint):longint;
var t,maxn,minn,sum:longint;
begin
sum:=0;
while a<>0 do
      begin
      sum:=sum+a mod 10;
      a:=a div 10;
      end;
maxn:=0;
minn:=9;
while b<>0 do
      begin
      if b mod 10>maxn then maxn:=b mod 10;
      if b mod 10<minn then minn:=b mod 10;
      b:=b div 10;
      end;
suan:=sum*maxn+minn;
end;

begin
assign(input,'express.in');
assign(output,'express.out');
reset(input);
rewrite(output);
read(tt);
for hh:=1 to tt do
    begin
    fillchar(hash,sizeof(hash),false);
    fillchar(a,sizeof(a),0);
    read(aa);
    read(kk);
    if aa=kk then
       begin
       writeln(0);
       continue;
       end;
    a[1]:=aa;
    a[2]:=suan(aa,aa);
    if a[2]=kk then
       begin
       writeln(1);
       continue;
       end;
    l[0]:=1;
    r[0]:=1;
    l[1]:=2;
    r[1]:=2;
    t:=2;
    k:=1;
    pd:=false;
    while true do
          begin
          inc(k);
          l[k]:=t+1;
          for i:=0 to k-1 do
              begin
              for j1:=l[i] to r[i] do
                  begin
                  for j2:=l[k-i-1] to r[k-i-1] do
                      begin
                      temp:=suan(a[j1],a[j2]);
                      if temp=kk then
                         begin
                         pd:=true;
                         break;
                         end;
                      if hash[temp mod 10000019]=false then
                         begin
                         hash[temp mod 10000019]:=true;
                         inc(t);
                         a[t]:=temp;
                         end;
                      end;
                  if pd=true then break;
                  end;
              if pd=true then break;
              end;
          if pd=true then
             begin
             writeln(k);
             break;
             end;
          r[k]:=t;
          if l[k]>r[k] then
             begin
             writeln(-1);
             break;
             end;

          end;
    end;
close(input);
close(output);
end.
