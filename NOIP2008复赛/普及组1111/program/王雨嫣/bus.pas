var n,d,s,sum,i,j:longint;
    k,l:char;
    a:array[1..2500]of char;
function pd(aa,bb:longint):boolean;
var i,nn,mm:longint;
begin
pd:=true;
nn:=0;
mm:=0;
for i:=aa to bb do
    if a[i]=k then inc(nn)
              else inc(mm);
if (abs(nn-mm)>d)and(mm<>0)and(nn<>0) then pd:=false;
end;
procedure try(i:longint);
var j:longint;
begin
inc(s);
if i=n then if s<sum then sum:=s;
for j:=i+1 to n do
    if pd(i+1,j) then begin
                      try(j);
                      dec(s);
                      end;
end;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
for i:=1 to n do
    read(a[i]);
k:=a[1];
for i:=1 to n do
    if a[i]<>k then l:=a[i];
sum:=maxlongint;
for j:=1 to n do
    if pd(1,j) then begin
                    try(j);
                    dec(s);
                    end;
writeln(sum);
close(input);
close(output);
end.