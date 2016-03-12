var  ans:array[1..10000]of longint;
     n,i,j,k,length:longint;

function min(a,b:longint):longint;
 begin
  if a>b then exit(b) else exit(a);
 end;

function max(a,b:longint):longint;
 begin
  if a>b then exit(a) else exit(b);
 end;

function f(x:longint):qword;
 begin
  if x=0 then exit(1);
  if x=1 then exit(2);
  if x=2 then exit(2);
  if x=3 then exit(2);
  if x=4 then exit(2);
  if x=5 then exit(1);
 end;

procedure add(x:qword);
 var a:array[1..10000]of longint;
     tt,i,j,k:longint;
 begin
  fillchar(a,sizeof(a),0);
  tt:=x;k:=0;
  while tt>0 do
   begin
    inc(k);
    a[k]:=tt mod 10;
    tt:=tt div 10;
   end;
  length:=max(length,k);
  for i:=1 to length do
   inc(ans[i],a[i]);
  for i:=1 to length do
   begin
    inc(ans[i+1],ans[i] div 10);
    ans[i]:=ans[i] mod 10;
   end;
  if ans[length+1]>0 then inc(length);
  end;

procedure add2(x,y:longint);
 var a,b,c:array[1..10000]of longint;
     i,j,tt,k1,k2,k3:longint;
  begin
   fillchar(c,sizeof(c),0);
   tt:=x;
  while tt>0 do
   begin
    inc(k1);
    a[k1]:=tt mod 10;
    tt:=tt div 10;
   end;

   tt:=y;
  while tt>0 do
   begin
    inc(k2);
    b[k2]:=tt mod 10;
    tt:=tt div 10;
   end;
  for i:=1 to k1 do
   for j:=1 to k2 do
   begin
    inc(c[i+j-1],a[i]*b[j]);
   end;
  for i:=1 to k1+k2-1 do
   begin
   inc(c[i+1],c[i] div 10);
   c[i]:=c[i] mod 10;
   end;
while c[k1+k2]>0 do begin inc(k1);c[k1+k2]:=c[k1+k2-1]div 10;c[k1+k2-1]:=c[k1+k2-1]mod 10;end;
  length:=max(length,k3);
  for i:=1 to length do
   inc(ans[i],c[i]);
  for i:=1 to length do
   begin
    inc(ans[i+1],ans[i] div 10);
    ans[i]:=ans[i] mod 10;
   end;
  if ans[length+1]>0 then inc(length);
  end;

procedure de(x,y:longint);
  var a,b,c:array[1..10000]of longint;
     i,j,tt,k1,k2,k3:longint;
  begin
   tt:=x;
   fillchar(c,sizeof(c),0);
  while tt>0 do
   begin
    inc(k1);
    a[k1]:=tt mod 10;
    tt:=tt div 10;
   end;

   tt:=y;
  while tt>0 do
   begin
    inc(k2);
    b[k2]:=tt mod 10;
    tt:=tt div 10;
   end;
  for i:=1 to k1 do
   for j:=1 to k2 do
   begin
    inc(c[i+j-1],a[i]*b[j]);
   end;
  for i:=1 to k1+k2-1 do
   begin
   inc(c[i+1],c[i] div 10);
   c[i]:=c[i] mod 10;
   end;
while c[k1+k2]>0 do begin inc(k1);c[k1+k2]:=c[k1+k2-1]div 10;c[k1+k2-1]:=c[k1+k2-1]mod 10;end;
  length:=max(length,k3);
  for i:=length downto 1 do
   dec(ans[i],c[i]);
  for i:=1 to length do
  if ans[i]<0 then
   begin
    inc(ans[i],10);
    dec(ans[i+1])
   end;
  if ans[length]=0 then dec(length);
  end;

begin
 assign(input,'sugar.in');
 assign(output,'sugar.out');
 reset(input);
 rewrite(output);
 fillchar(ans,sizeof(ans),0);

 readln(n);
 if n<=120000 then
 begin
  for i:=0 to min(5,n) do
   for j:=0 to (n-i) div 5 do
    add(f(i)*((n-i-5*j) div 2 +1 ));

 for i:=length downto 1 do write(ans[i]);
 writeln;
 end
 else begin
    for i:=0 to min(5,n) do
    begin
     add2(f(i)*(1+(n-i) div 2),((n-i)div 5)+1);
     de((n-i),((n-i)+5) div 20);
    end;
     for i:=length downto 1 do write(ans[i]);
    writeln;
    end;


 close(input);
 close(output);
end.
