var a,b,c,i,j,k,n,m,p,o:longint;
    hh,ll,aa,bb,cc,nn,mm,pp:string;

begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(hh);
readln(ll);
if hh[1]<>'0' then begin aa:=hh[1]+hh[2]; val(aa,a,o); end
              else a:=ord(hh[2])-48;
if hh[4]<>'0' then begin bb:=hh[4]+hh[5]; val(bb,b,o); end
              else b:=ord(hh[5])-48;
if hh[7]<>'0' then begin cc:=hh[7]+hh[8]; val(cc,c,o); end
              else c:=ord(hh[8])-48;
if ll[1]<>'0' then begin nn:=ll[1]+ll[2]; val(nn,n,o); end
              else n:=ord(ll[2])-48;
if ll[4]<>'0' then begin nn:=ll[4]+ll[5]; val(mm,m,o); end
              else m:=ord(ll[5])-48;
if ll[7]<>'0' then begin pp:=ll[1]+ll[2]; val(pp,p,o); end
              else p:=ord(ll[8])-48;
{a:=20;
b:=0;
c:=0;
n:=20;
m:=1;
p:=1; }
if n<a then n:=n+24;
while (a<>n)or(b<>m)or(c<>p) do
     begin
     while (b<>m)or(a<>n)or(c<>p) do
           begin
           if b>60 then begin b:=b-60; inc(a); end;
           while (c<>p)or(a<>n)or(b<>m) do
                 begin
                 inc(c);
                 inc(k);
                 if c>60 then begin c:=c-60; inc(b); end;
                 end;
           end;
     end;
a:=0;
b:=0;
c:=0;
while k>0 do
      begin
      dec(k);
      inc(c);
      if c>60 then begin c:=c-60; inc(b); end;
      if b>60 then begin b:=b-60; inc(a); end;
      end;
if a>=10 then write(a)
        else weite('0',a);
write(':');
if b>=10 then write(b,':')
        else write('0',b,':');
if c>=10 then write(c)
        else write('0',c);
close(input);
close(output);
end.