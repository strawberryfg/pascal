var i,n,tot,j,t:longint;
    s:string;
    hasha,hashb,thasha,thashb:array[0..10]of longint;
    a,b:array[0..200]of longint;
function doit:boolean;
var i:longint;
begin
for i:=0 to 9 do
    begin
    if (hasha[i]=0)and(hashb[i]<>0) then exit(false);
    if (hashb[i]=0)and(hasha[i]<>0) then exit(false);
    end;
exit(true);
end;
function pd:boolean;
var i,t1,t2:longint;
begin
for i:=1 to a[0]-1 do
    begin
    t1:=a[i]; t2:=a[i+1];
    if (t2+1<=9) then
       begin
       if ((i=1)and(t1-1>0))or((i<>1)and(t1-1>=0)) then
          begin
          dec(hasha[t1]); dec(hasha[t2]);
          inc(hasha[t1-1]); inc(hasha[t2+1]);
          if doit then exit(true);
          hasha:=thasha;
          end;
       end;
    if (t1+1<=9) then
       begin
       if t2-1>=0 then
          begin
          dec(hasha[t1]); dec(hasha[t2]);
          inc(hasha[t1+1]);inc(hasha[t2-1]);
          if doit then exit(true);
          hasha:=thasha;
          end;
       end;
    end;
for i:=1 to b[0]-1 do
    begin
    t1:=b[i]; t2:=b[i+1];
    if (t2+1<=9) then
       begin
       if ((i=1)and(t1-1>0))or((i<>1)and(t1-1>=0)) then
          begin
          dec(hashb[t1]); dec(hashb[t2]);
          inc(hashb[t1-1]); inc(hashb[t2+1]);
          if doit then exit(true);
          hashb:=thashb;
          end;
       end;
    if (t1+1<=9) then
       begin
       if t2-1>=0 then
          begin
          dec(hashb[t1]); dec(hashb[t2]);
          inc(hashb[t1+1]);inc(hashb[t2-1]);
          if doit then exit(true);
          hashb:=thashb;
          end;
       end;
    end;
exit(false);
end;
begin
assign(input,'friends.in');
reset(input);
assign(output,'friends.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    tot:=0;
    fillchar(a,sizeof(a),0);
    fillchar(b,sizeof(b),0);
    fillchar(hasha,sizeof(hasha),0);
    fillchar(hashb,sizeof(hashb),0);
    readln(s);
    t:=pos(' ',s);
    for j:=1 to t-1 do
        begin
        inc(tot);
        a[tot]:=ord(s[j])-ord('0');
        inc(hasha[a[tot]]);
        end;
    delete(s,1,t);
    a[0]:=tot;
    tot:=0;
    for j:=1 to length(s) do
        begin
        if s[j]=' 'then continue;
        inc(tot);
        b[tot]:=ord(s[j])-ord('0');
        inc(hashb[b[tot]]);
        end;
    b[0]:=tot;
    thasha:=hasha; thashb:=hashb;
    if doit then writeln('friends')
       else if pd then writeln('almost friends') else writeln('nothing');
    end;
close(input);
close(output);
end.