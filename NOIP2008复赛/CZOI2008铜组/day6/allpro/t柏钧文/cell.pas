var t,n,m,i,j,dt:longint;
        ch:char;
        a:array[1..70,1..70]of integer;

procedure try(x,y:longint);
  var q,p,k:longint;
  begin
  q:=x;p:=y;
  repeat
  a[q,p]:=dt;
  inc(p);
  until a[q,p]=0;
  for k:=y to p-1 do
        if a[q+1,k]>0 then begin try(q+1,k);break;end;
  end;

begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(m,n);
for i:=1 to m do
        begin
        for j:=1 to n do
                begin
                read(ch);
                val(ch,a[i,j]);
                end;
        readln;
        end;
dt:=-1;
for i:=1 to m do
    for j:=1 to n do
        if (a[i,j]>0)then begin try(i,j);dec(dt);end;
t:=0;
for i:=1 to m do
        for j:=1 to n do
            if a[i,j]<t then t:=a[i,j];
writeln(-t);
close(input);
close(output);
end.