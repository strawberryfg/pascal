var line:array[1..2501]of char;
    n,d,i,j,num,sum:longint;
function max(w:longint):longint;
begin
  if w>n then max:=n
         else max:=w;
end;
function check(a,b:longint):boolean;
var i,numh,numj:longint;
begin
  check:=false;
  numh:=0;
  numj:=0;
  for i:=a to b do
      if line[i]='H' then inc(numh)
                     else inc(numj);
  if (abs(numh-numj)<=d)or(numh=b-a+1)or(numj=b-a+1) then check:=true;
end;
procedure search(people,a,b:longint);
var i:longint;
begin
  if people=0 then begin writeln(sum);close(input);close(output);halt;end
              else for i:=b downto a do
                         if check(a,i) then
                         begin num:=num-(i-a+1);inc(sum);search(num,i+1,max(b+people));end
                                       else search(people-1,a,b-1);
end;
begin
  assign(input,'bus.in');
  reset(input);
  assign(output,'bus.out');
  rewrite(output);
  readln(n,d);
  num:=n;
  for i:=1 to n do
      read(line[i]);
  sum:=0;
  search(n,1,n);
  close(input);
  close(output);
end.
