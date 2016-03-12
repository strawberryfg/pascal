var a:array[0..21,0..21]of longint;
    i,j,k,t,n:longint;

procedure try(var x,t:longint);
begin
 if (t=1)and(a[i,j+1]=0) then begin a[i,j+1]:=x; inc(j); exit; end
                         else t:=2;
 if (t=2)and(a[i+1,j]=0) then begin a[i+1,j]:=x; inc(i); exit; end
                         else t:=3;
 if (t=3)and(a[i,j-1]=0) then begin a[i,j-1]:=x; dec(j); exit; end
                         else t:=4;
 if (t=4)and(a[i-1,j]=0) then begin a[i-1,j]:=x; dec(i); exit; end
                         else t:=1;
 if (t=1)and(a[i,j+1]=0) then begin a[i,j+1]:=x; inc(j); exit; end
                         else t:=2;
end;

begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
for i:=0 to 21 do
  for j:=0 to 21 do
    a[i,j]:=0;
for i:=0 to 21 do
  a[n+1,i]:=maxlongint;
for i:=0 to 21 do
  a[i,n+1]:=maxlongint;
for i:=0 to 21 do
  begin
    a[0,i]:=maxlongint;
    a[i,0]:=maxlongint;
  end;
a[1,1]:=1;
i:=1;
j:=1;
t:=1;
for k:=2 to n*n do
  try(k,t);
for i:=1 to n do
  begin
  for j:=1 to n do
    write(a[i,j]:4);
  writeln;
  end;
close(input);
close(output);
end.