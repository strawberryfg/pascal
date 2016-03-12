var n,x,s:longint;
    i,t:longint;
    j:integer;
    a:array[1..4] of longint;

function pd(w:longint;jz:integer):boolean;
var k,l:integer;
    b:array[1..100] of integer;
begin
    for k:=1 to 100 do b[k]:=0;
    pd:=true;
    k:=0;
    repeat
      k:=k+1;
      b[k]:=w mod jz;
      w:=w div jz;
    until w=0;
    l:=k;k:=1;
    for k:=1 to l div 2 do
      if b[i]<>b[l-k+1] then pd:=false;
end;

begin
  assign(input,'base.in');
  assign(output,'base.out');
  reset(input);
  rewrite(output);
  for i:=1 to 4 do read(a[i]);
  s:=0;
  for i:=trunc(sqrt(a[1])) to trunc(sqrt(a[2]))+1 do
   begin
     x:=i*i;
     if (x>=a[1])and(x<=a[2]) then begin
                                     t:=0;
                                     for j:=a[3] to a[4] do
                                       if pd(x,j)=true then t:=t+1;
                                     if t=1 then s:=s+1;
                                   end;
   end;
   writeln(s);
   close(input);
   close(output);
end.
