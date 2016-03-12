var i,n,j,k,l,t:longint;
    a,he:array[1..200] of longint;
function zhuan(num:longint):longint;
   var jieshu:boolean;
       sum,x,i,xx:longint;
   begin
   jieshu:=false;
   sum:=0;
   while jieshu=false do
      begin
      xx:=1;
      x:=num mod 10;
      for i:=1 to l+1 do
          xx:=xx*x;
      if num div 10>0 then num:=num div 10
                      else jieshu:=true;
      inc(sum,xx);
      end;
   zhuan:=sum;
   end;
begin
assign(input,'ghillie.in');
reset(input);
assign(output,'ghillie.out');
rewrite(output);
readln(n);
i:=0;
while not eoln do begin inc(i);read(a[i]);end;
for l:=1 to n do
    begin
    for j:=1 to i do
        he[j]:=zhuan(a[j]);
    for j:=1 to i do
        for k:=1 to i do
            if he[j]=a[k] then a[k]:=-1;
    end;
for j:=1 to i-1 do
 for k:=j+1 to i do
     if a[j]>a[k] then begin t:=a[j];a[j]:=a[k];a[k]:=t;end;
for j:=1 to i-1 do
    if a[j]<>-1 then write(a[j],' ');
write(a[i]);
close(input);
close(output);
end.
