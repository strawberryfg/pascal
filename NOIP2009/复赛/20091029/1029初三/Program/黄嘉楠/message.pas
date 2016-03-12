var t,j,i,t1,n,m,x,y:longint;
    a:array[1..100,1..100] of longint;
    b:array[1..100,1..100] of longint;
procedure search(s:longint);
          var k:longint;
begin
if s=j then t:=t+1;
if t=2 then begin if t1<>1 then writeln('T');
                  t1:=1;
                  exit;
                  end;
for k:= 1 to n do
    if (a[s,k]=1) and (b[s,k]<>1) then begin b[s,k]:=1;search(k);end;
end;
begin
assign(input,'message.in');
assign(output,'message.out');
reset(input);
rewrite(output);
readln(n,m);
for i:= 1 to m do
    begin
    readln(x,y);
    a[x,y]:=1;
    end;
for i:= 1 to n do
    begin
    fillchar(b,sizeof(b),0);
    t1:=0;
    t:=0;
    j:=i;
    search(i);
    if t1=0 then writeln('F');
    end;
close(input);
close(output);
end.
