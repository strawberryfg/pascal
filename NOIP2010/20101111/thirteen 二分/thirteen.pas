var t,max,tot,sum,num,i:longint;
    que,f:array[1..3000000]of longint;
function check(a:longint):boolean;
var code:integer;
    i:longint;
    s:string;
    pd:boolean;
begin
str(a,s);
pd:=true;
for i:=1 to length(s)+1-2 do
   begin
   if (s[i]='1')and(s[i+1]='3') then
      begin pd:=false;break; end;
   end;
if not pd then exit(true)
   else exit(false);
end;
function work(x:longint):longint;
var left,right,mid:longint;
    pd:boolean;
begin
left:=1;   right:=sum;
if x>=f[sum] then exit(sum);
if x<f[1] then exit(0);
if x=f[1] then exit(1);
pd:=false;
while (left<right-1) do
  begin
  mid:=(left+right) div 2;
  if x<f[mid] then right:=mid
     else begin
          left:=mid;
          if f[mid]=x then begin pd:=true;break; end;
          end
  end;
if pd then exit(mid);
if (x>f[left])and(x<f[right]) then exit(left)
   else exit(right);

end;
begin
assign(input,'thirteen.in');
reset(input);
assign(output,'thirteen.out');
rewrite(output);
readln(t);
while t<>0 do
  begin
  inc(tot);
  que[tot]:=t;
  if t>max then max:=t;
  readln(t);

  end;
for i:=1 to max div 13 do
    begin
    num:=i*13;
    if check(num) then
       begin
       inc(sum);
       f[sum]:=num;
       end;
    end;
for i:=1 to tot do
    begin
    writeln(work(que[i]));
    end;
close(input);
close(output);
end.
