var n,d,i,j,max,nq,s,count,c1,c2,s1:longint;
    x:char;
    a,b:array[1..2500] of longint;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
for i:=1 to n do
    begin
    read(x);
    if x='H' then a[i]:=1
             else a[i]:=-1;
    end;
max:=0;
nq:=0;
for i:=1 to n do
    if a[i]=1 then
              begin
              for j:=i+1 to n do
                  if a[j]=-1 then inc(nq)
                             else
                             begin
                             if nq>max then max:=nq;
                             nq:=0;
                             end;
              if nq>max then max:=nq;
              b[i]:=max;
              max:=0;
              nq:=0;
              end
              else
              begin
              for j:=i+1 to n do
                  if a[j]=1  then inc(nq)
                             else
                             begin
                             if nq>max then
                                       max:=nq;
                                       nq:=0;
                             end;
              if nq>max then max:=nq;
              b[i]:=max;
              max:=0;
              nq:=0;
              end;
for i:=1 to n do
    begin
    inc(count,a[i]);
    if a[i]=1 then
              begin
              inc(c1);
              if (c1=1)and(c2<>0)and(abs(count)-b[i]=d+1)then
                                 begin
                                 inc(s);
                                 c2:=0;
                                 end;
              end
              else
              begin
              inc(c2);
              if (c2=1)and(c1<>0)and(abs(count)-b[i]=d+1) then
                                  begin
                                  inc(s);
                                  c1:=0;
                                  end;
              end;


    if abs(count)-b[i]=d+1 then
                           begin
                           if (c1>0)and(c2>0) then
                           begin
                           inc(s);
                           count:=0;
                           c1:=0;
                           c2:=0;
                           end;
                           end;
    end;
writeln(s+1);
close(input);
close(output);
end.
