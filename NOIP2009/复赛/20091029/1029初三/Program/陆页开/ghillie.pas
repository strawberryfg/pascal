var n,p,i,m,j,k,u,h:longint;
    a,b:array[1..200] of longint;
procedure setup;
  begin
  assign(input,'ghillie.in');
  reset(input);
  assign(output,'ghillie.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
function chengfang(r,e,d,f:longint):longint;
  var i,rr,ee,dd:longint;
  begin
  rr:=r;
  ee:=e;
  dd:=d;
  for i:=1 to f do
      begin
      rr:=rr*r;
      ee:=ee*e;
      dd:=dd*d;
      end;
  chengfang:=rr+ee+dd;
  end;
function chengfang1(e,d,f:longint):longint;
  var i,ee,dd:longint;
  begin
  ee:=e;
  dd:=d;
  for  i:=1 to f do
       begin
       ee:=ee*e;
       dd:=dd*d
       end;
  chengfang1:=ee+dd;
  end;
function jisuan(a,q:longint):longint;
  var bai,shi,ge,i,t:longint;
  begin
  if a div 100>0 then begin
                      bai:=a div 100;
                      shi:=(a-bai*100) div 10;
                      ge:=a mod 10;
                      jisuan:=chengfang(bai,shi,ge,q);
                      exit;
                      end
                 else begin
                      if a div 10<0 then begin
                         for i:=1 to q do
                             t:=t+a*i;
                         jisuan:=t;
                         exit;
                         end
                                    else begin
                                         shi:=a div 10;
                                         ge:=a mod 10;
                                         jisuan:=chengfang1(shi,ge,q);

                                         exit;
                                         end;
                      end;
  end;
begin
setup;
readln(n);
while not eoln do begin
                 i:=i+1;
                 read(p);
                 a[i]:=p;
                 end;
m:=i;
for i:=1 to m do
    b[i]:=-1;
for i:=1 to n do
    begin
    for j:=1 to m do
        if b[j]<>0 then b[j]:=jisuan(a[j],i);
    for k:=1 to m do
        for u:=1 to m do
            if b[k]=a[u] then begin b[u]:=0;end;
    end;
for i:=1 to m do
    if b[i]=0 then a[i]:=0;
for i:=1 to m-1 do
    for j:=i+1 to m do
        if a[i]>a[j] then begin
                          h:=a[i];
                          a[i]:=a[j];
                          a[j]:=h;
                          end;
for i:=1 to m do
    if (a[i]<>0) and (a[i+1]<>0) then write(a[i],' ')
                                 else if (a[i]<>0) and (a[i+1]=0) then begin write(a[i]);endit;halt;end;
endit;
end.
