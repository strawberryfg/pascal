var   n,i:longint;
      b:array[1..200] of string;
procedure gao(i:longint);
var i1,i2,k,t,a1,a2:longint;
begin
   i1:=1;
   i2:=1;
   k:=0;
   t:=0;
   a1:=length(b[i-3]);
   a2:=length(b[i-1]);
   while (i1<=a1)and(i2<=a2) do
   begin
   t:=ord(b[i-3,i1])-48+ord(b[i-1,i2])-48+k;
   if t>=10 then k:=1
            else k:=0;
   t:=t-k*10;
   b[i]:=b[i]+char(t+48);
   inc(i1);
   inc(i2);
   end;
   while i2<=a2 do
   begin
   t:=ord(b[i-1,i2])-48+k;
   if t>=10 then k:=1
            else k:=0;
   t:=t-k*10;
   b[i]:=b[i]+char(t+48);
   inc(i2);
   end;
   if k=1 then b[i]:=b[i]+'1';
end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output); 
read(n);
b[1]:='1';
b[2]:='1';
b[3]:='1';
      for i:=4 to n do
      gao(i);
      for i:=length(b[n]) downto 1 do
      write(b[n,i]);
close(input);
close(output);
end.
