var n,tm,i,total,left,right,mid:longint;
    a,b:array[1..100000]of longint;
    t:longint;
    pd:boolean;
begin
assign(input,'sqrt.in');
reset(input);
assign(output,'sqrt.out');
rewrite(output);
readln(n);
tm:=maxlongint;
for i:=1 to trunc(sqrt(tm)) do
    begin
    inc(total);
    a[total]:=i*i;
    b[total]:=i;
    end;
left:=1; right:=total;
while left<right-1 do
  begin
  mid:=(left+right) div 2;
  if a[mid]>=n then right:=right-1 else left:=left+1;
  end;
if a[left]>=n then mid:=left else mid:=right;
pd:=true;
for i:=mid to total do
    begin
    if a[i] mod n=0 then
        begin
        t:=a[i] div n;
        //t:=a[i] div n+b[i]*2+n;
        writeln(int64(t)+int64(b[i]*2)+int64(n));
        pd:=false;
        break;
        end;
    end;
if pd then
   begin
   //t:=n+n+2*n;
   writeln(int64(4)*int64(n));
   end;
close(input);
close(output);
end.
