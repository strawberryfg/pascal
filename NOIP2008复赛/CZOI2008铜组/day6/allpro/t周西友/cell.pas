var a:array[0..70,0..70]of longint;
    b:array[0..70,0..70]of boolean;
    str:array[1..70]of string;
    i,j,m,n,total,ti,tj:longint;
    ls:string;
    f:boolean;
procedure kk;
begin
if ls='i+1' then begin
while (a[i+1][j]<>0)or(a[i-1,j]<>0)or(a[i,j-1]<>0)or(a[i,j+1]<>0) do
  begin
  b[i,j]:=false;
  b[i+1][j]:=false;
  b[i][j+1]:=false;
  b[i-1][j]:=false;
  b[i][j-1]:=false;
  if (a[i+1,j]<>0)and(ls<>'i+1') then begin i:=1+1;kk;ls:='i+1';end
  else if (a[i-1,j]<>0)and(ls<>'i-1') then begin i:=i-1;kk;ls:='i-1';end
  else if (a[i,j-1]<>0)and(ls<>'j-1') then begin j:=j-1;kk;ls:='j-1';end
  else if (a[i,j+1]<>0)and(ls<>'j+1') then begin j:=j+1;kk;ls:='j+1';end ;
  end;
  exit;
 end;
if ls='i-1' then begin
while (a[i-1,j]<>0)or(a[i,j-1]<>0)or(a[i,j+1]<>0) do
  begin
  b[i,j]:=false;
  b[i+1][j]:=false;
  b[i][j+1]:=false;
  b[i-1][j]:=false;
  b[i][j-1]:=false;
  if (a[i+1,j]<>0)and(ls<>'i+1') then begin i:=1+1;kk;ls:='i+1';end
  else if (a[i-1,j]<>0)and(ls<>'i-1') then begin i:=i-1;kk;ls:='i-1';end
  else if (a[i,j-1]<>0)and(ls<>'j-1') then begin j:=j-1;kk;ls:='j-1';end
  else if (a[i,j+1]<>0)and(ls<>'j+1') then begin j:=j+1;kk;ls:='j+1';end ;
  end;
  exit;
  end;
if ls='j+1' then begin
while (a[i+1][j]<>0)or(a[i-1,j]<>0)or(a[i,j+1]<>0) do
  begin
  b[i,j]:=false;
  b[i+1][j]:=false;
  b[i][j+1]:=false;
  b[i-1][j]:=false;
  b[i][j-1]:=false;
  if (a[i+1,j]<>0)and(ls<>'i+1') then begin i:=1+1;kk;ls:='i+1';end
  else if (a[i-1,j]<>0)and(ls<>'i-1') then begin i:=i-1;kk;ls:='i-1';end
  else if (a[i,j-1]<>0)and(ls<>'j-1') then begin j:=j-1;kk;ls:='j-1';end
  else if (a[i,j+1]<>0)and(ls<>'j+1') then begin j:=j+1;kk;ls:='j+1';end ;
  end;
  exit;
  end;
if ls='j-1' then begin
while (a[i+1][j]<>0)or(a[i-1,j]<>0)or(a[i,j-1]<>0) do
  begin
  b[i,j]:=false;
  b[i+1][j]:=false;
  b[i][j+1]:=false;
  b[i-1][j]:=false;
  b[i][j-1]:=false;
  if (a[i+1,j]<>0)and(ls<>'i+1') then begin i:=1+1;kk;ls:='i+1';end
  else if (a[i-1,j]<>0)and(ls<>'i-1') then begin i:=i-1;kk;ls:='i-1';end
  else if (a[i,j-1]<>0)and(ls<>'j-1') then begin j:=j-1;kk;ls:='j-1';end
  else if (a[i,j+1]<>0)and(ls<>'j+1') then begin j:=j+1;kk;ls:='j+1';end ;
  end;
  exit;
 end;
 end;
begin
 assign(input,'d:\cell.in');
 reset(input);
 assign(output,'d:\cell.out');
 rewrite(output);
 readln(m,n);
 total:=0;
 for i:=1 to m do
  readln(str[i]);
 for i:=1 to m do
  for j:=1 to n do begin a[i,j]:=ord(str[i][j])-48;b[i,j]:=true;end;
  for i:=1 to m do
   for j:=1 to n do
    if a[i,j]=0 then b[i,j]:=false;
   i:=1;
   j:=1;
   f:=true;
   while f=true do
   begin
    total:=total+1;
    ls:='';
    kk;
    for ti:=1 to n do
     for tj:=1 to m do
      if (b[ti,tj]<>false)and(a[ti,tj]<>0) then begin i:=ti;j:=tj;end;
     f:=false;
     for ti:=1 to m do
      for tj:=1 to n do
       if b[ti,tj]=true then f:=true;
   end;
     writeln(total);
   close(input);
   close(output);
end.

