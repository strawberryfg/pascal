var i,n,m,q,x,y,total,tot,sum:longint;
        aa:char;
        ta:array[1..30000] of longint;
        a:array[1..30000,0..1000]of longint;
        tip:array[1..30000]of boolean;

procedure try1(x,k:longint);
  var i:longint;
  begin
  for i:=1 to a[x,0] do
      if a[x,i]<>-maxlongint then if tip[a[x,i]] then
        begin
        tip[a[x,i]]:=false;
        if ta[a[x,i]]>=k then if ta[a[x,i]]<sum then sum:=ta[a[x,i]];
        try1(a[x,i],k);
        end;
  end;

procedure try2(x,y:longint);
  var i:longint;
  begin
  for i:=1 to a[x,0] do
        if a[x,i]=y then begin a[x,i]:=-maxlongint;break; end;
  for i:=1 to a[y,0] do
        if a[y,i]=x then begin a[y,i]:=-maxlongint;break; end;
  end;

procedure try3(x,k:longint);
  begin
  ta[x]:=k;
  end;

begin
assign(input,'boring.in');
reset(input);
assign(output,'boring.out');
rewrite(output);
readln(n,m,q);
for i:=1 to n do
        readln(ta[i]);
for i:=1 to m do
        begin
        readln(x,y);
        inc(a[x,0]);
        a[x,a[x,0]]:=y;
        inc(a[y,0]);
        a[y,a[y,0]]:=x;
        end;
total:=0;
for i:=1 to q do
        begin
        read(aa);read(x);readln(y);
        if aa='F' then begin
                       sum:=maxlongint;
                       fillchar(tip,sizeof(tip),true);
                       if ta[x]>=y then if ta[x]<sum then sum:=ta[x];
                       try1(x,y);
                       if sum<>maxlongint then inc(total,sum);
                       inc(tot);
                       end;
        if aa='U' then begin try3(x,y) end;
        if aa='E' then try2(x,y);
        end;
writeln(total/tot:0:3);
close(input);
close(output);
end.
