var i,j,m,max,loc,tot,t:longint;
    a,s:array[1..10,1..10]of longint;
    fx:array[1..10,1..10]of longint;
    fy:array[1..10,1..10]of longint;
    x,y:array[1..10]of longint;
begin
readln(m);
for i:=1 to m do
    begin
    for j:=1 to i do
        read(a[i,j]);
     readln;
    end;
s[1,1]:=a[1,1];
fx[1,1]:=0; fy[1,1]:=0;
for i:=2 to m do
    begin
    s[i,1]:=s[i-1,1]+a[i,1];
    fx[i,1]:=i-1; fy[i,1]:=1;
    s[i,i]:=s[i-1,i-1]+a[i,i];
    fx[i,i]:=i-1; fy[i,i]:=i-1;
    for j:=2 to i-1 do
        begin
        if s[i-1,j-1]>s[i-1,j] then begin
                                    s[i,j]:=a[i,j]+s[i-1,j-1];
                                    fx[i,j]:=i-1;
                                    fy[i,j]:=j-1;
                                    end
          else
          begin
          s[i,j]:=a[i,j]+s[i-1,j]; fx[i,j]:=i-1; fy[i,j]:=j;
          end;
        end;
    end;
for i:=1 to m do
    if s[m,i]>max then begin max:=s[m,i];loc:=i;end;
writeln(max);
inc(tot);
x[tot]:=m; y[tot]:=loc;
i:=m; j:=loc;
while (i<>0)and(j<>0) do
      begin
      t:=i;
      i:=fx[i,j];
      j:=fy[t,j];
      inc(tot);
      x[tot]:=i;
      y[tot]:=j;
      end;
dec(tot);
for i:=tot downto 1 do
    writeln(x[i],' ',y[i],':',a[x[i],y[i]]);
end.
