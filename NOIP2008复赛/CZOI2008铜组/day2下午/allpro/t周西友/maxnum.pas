program ex3;
var i,j,f,l,k,temp:longint;
    a,b:array[1..1000]of longint;
begin
 assign(input,'maxnum.in');
 reset(input);
 assign(output,'maxnum.out');
 rewrite(output);
 i:=1;
 while not eof do
  begin
   readln(a[i]);
   inc(i);
  end;
  i:=i-1;
  k:=1;
  for j:=1 to trunc(sqrt(a[1])) do
  if  a[1] mod j=0 then begin b[k]:=j;inc(k);end;
  for j:=2 to i do  for l:=1 to k-1 do if a[j] mod b[l]<>0 then b[l]:=0;
  for j:=1 to k-1 do
   for f:=j to k do
   if b[j]<b[f] then begin temp:=b[j];b[j]:=b[f];b[f]:=temp;end;
   writeln(b[1]);
  close(input);
  close(output);
end.
