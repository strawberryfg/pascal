var n,i,j,sum,fmax,t,up:longint;
    hash,a,b,c,add:array[0..20]of longint;
    app:array[1..1000]of longint;
    d:array[1..3,0..20]of longint;
procedure work(dep,tot,now,sum:longint);
var i,j,t,cnt:longint;
begin
{inc(sss);}
if (dep=2)and(fmax<>0)and(now<fmax) then exit;
if dep>3 then begin  if now>fmax then fmax:=now;exit; end;
if (dep<3)and(sum<now) then exit;
if (tot+1+(3-dep)*2>n) then exit;
for i:=1 to n do
    begin
    if hash[i]=0 then
       begin
       t:=b[dep]+a[i];
       if (dep>1)and(t>now)then continue;
       if (t>up*dep) then continue;
       cnt:=c[dep]+1;
       if (tot+1+(3-dep)*2>n) then continue;
       if (t=now) then
          begin
             if (c[dep]+1<2) then continue;
             b[dep]:=t;
             c[dep]:=c[dep]+1;
             d[dep,cnt]:=d[dep,cnt-1]+a[i];
             hash[i]:=1;
             app[t]:=app[t]+1;
             {if ok(dep)then} work(dep+1,tot+1,now,sum-a[i]);
             app[t]:=0;
             b[dep]:=t-a[i];
             d[dep,cnt]:=0;
             c[dep]:=c[dep]-1;
             hash[i]:=0;
          end
       else if (t<now) then
               begin
               b[dep]:=t;
               c[dep]:=c[dep]+1;
               hash[i]:=1;
               d[dep,cnt]:=d[dep,cnt-1]+a[i];
               {if ok(dep) then}
               if app[t]=0 then
                  begin
                  app[t]:=1;
                  work(dep,tot+1,now,sum-a[i]);
                  app[t]:=0;
                  end;
               b[dep]:=t-a[i];
               d[dep,cnt]:=0;
               c[dep]:=c[dep]-1;
               hash[i]:=0;
               end
           else if (dep=1) then
                   begin
                   for j:=0 to 1 do
                       begin
                       if (j=0)and(t>up) then continue;
                       if (j=1)and(c[dep]+1=1) then continue;
                       b[dep]:=t;
                       c[dep]:=c[dep]+1;
                       hash[i]:=1;
                       d[dep,cnt]:=d[dep,cnt-1]+a[i];
                       {if ok(dep) then}

                       if app[t]=0 then
                          begin
                          app[t]:=1;
                          if j=0 then work(dep,tot+1,now,sum-a[i])
                             else work(dep+1,tot+1,t,sum-a[i]);
                          app[t]:=0;
                          end;
                       b[dep]:=t-a[i];
                       d[dep,cnt]:=0;
                       c[dep]:=c[dep]-1;
                       hash[i]:=0;
                       end;
                   end;
       end;
    end;
end;
begin
assign(input,'stick.in');
reset(input);
assign(output,'stick.out');
rewrite(output);
readln(n);
sum:=0;
for i:=1 to n do
    begin
    read(a[i]);
    hash[i]:=0;
    sum:=sum+a[i];
    end;
for i:=1 to n-1 do
    for j:=i+1 to n do
        begin
        if a[i]>a[j] then begin t:=a[i];a[i]:=a[j];a[j]:=t; end;
        end;
fmax:=0;
up:=sum div 3;
work(1,0,0,sum);
writeln(fmax);
close(input);
close(output);
end.
