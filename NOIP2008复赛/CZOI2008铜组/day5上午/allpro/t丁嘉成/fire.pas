program fire;

const maxn=1000;

type list=array[0..maxn,0..maxn]of char;

var a:list;
    total,n:longint;

procedure startt;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
reset(output);
end;

procedure endit;
begin
close(input);
close(output);
end;

procedure intt;
var i,j:longint;
begin
readln(n);
for i:=0 to maxn do
  for j:=0 to maxn do
    a[i,j]:='f';
for i:=1 to n do
  begin
    for j:=1 to n do
      read(a[i,j]);
    readln;
  end;
end;

procedure outt;
begin
writeln(total);
end;

procedure try(h,k:longint);
var th,tk:longint;
begin
th:=h;
tk:=k;
while a[th,tk]<>'f' do
  begin
    dec(th);
    if a[th,tk]='x' then break;
    if a[th,tk]='y' then exit;
    if a[th,tk]='f' then break;
  end;
th:=h;
tk:=k;
while a[th,tk]<>'f' do
  begin
    inc(th);
    if a[th,tk]='x' then break;
    if a[th,tk]='y' then exit;
    if a[th,tk]='f' then break;
  end;
th:=h;
tk:=k;
while a[th,tk]<>'f' do
  begin
    dec(tk);
    if a[th,tk]='x' then break;
    if a[th,tk]='y' then exit;
    if a[th,tk]='f' then break;
  end;
th:=h;
tk:=k;
while a[th,tk]<>'f' do
  begin
    inc(tk);
    if a[th,tk]='x' then break;
    if a[th,tk]='y' then exit;
    if a[th,tk]='f' then break;
  end;
a[h,k]:='y';
inc(total);
end;

procedure runit;
var i,j:longint;
begin
for i:=1 to n do
  for j:=1 to n do
    if a[i,j]<>'x' then try(i,j);
end;

begin
startt;
intt;
runit;
outt;
endit;
end.
