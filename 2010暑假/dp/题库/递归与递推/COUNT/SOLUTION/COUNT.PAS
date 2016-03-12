program ex;
 var
  k,i,j,l,m,n:longint;
  data:array[0..100]of longint;
  count:array[0..9]of longint;
 function f(x:longint):longint;
  var
   i,t:longint;
  begin
   t:=0;
   for i:=x downto 0 do
    t:=t*10+data[i];
   f:=t;
  end;
 procedure int(x,y:Longint);
  begin
   inc(count[x],y);
  end;
 procedure jia(y:Longint);
  var
   I:longint;
  begin
   for i:=0 to 9 do int(i,y);
  end;
 function t(x:longint):longint;
  var
   i,et:longint;
  begin
   et:=1;
   for i:=1 to x do et:=et*10;
   t:=et;
  end;
 begin
  assign(input,'count.in');
  assign(output,'count.out');
  reset(input);rewrite(output);
  read(n);
  i:=0;k:=0;
  while n>0 do
   begin
    data[i]:=n mod 10;
    n:=n div 10;
    k:=k*10+1;
    i:=i+1;
   end;
  i:=i-1;
  for j:=i downto 0 do
   begin
    jia((data[j])*j*t(j-1)) ;
    for l:=0 to data[j]-1 do int(l,t(j));
    int(data[j],f(j-1)+1);
   end;
  count[0]:=count[0]-k;
  for i:=1 to 10 do
   begin
    writeln(count[i-1]);
   end;
  close(output);
 end.
