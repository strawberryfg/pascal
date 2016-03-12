var i,j,count:longint;
    a:array[1..9,1..9]of longint;
function pd(number,heng,zong:longint):boolean;
var i,j,nh,nz:longint;
begin
  pd:=true;
  for i:=1 to 9 do
    if (a[heng,i]=number)or(a[i,zong]=number) then begin pd:=false; exit; end;
  nh:=(heng+2)div 3; nz:=(zong+2)div 3;
  for i:=nh to nh+2 do
    for j:=nz to nz+2 do
        if a[i,j]=number then begin pd:=false; exit; end;
end;
procedure print;
var i,j:longint;
begin
  for i:=1 to 9 do
  begin
    for j:=1 to 8 do
        write(a[i,j],' ');
    writeln(a[i,9]);
  end;
  close(input);
  close(output);
  halt;
end;
procedure tian(count,h,z:longint);
var i:longint;
begin
  if count=0 then print;
  if a[h,z]<>0 then
    begin
      if z+1>9 then tian(count,h+1,1)
               else tian(count,h,z+1);
      exit;
    end;
  for i:=1 to 9 do
  begin
    if pd(i,h,z) then
    begin
      a[h,z]:=i;
      if z+1>9 then tian(count-1,h+1,1) else tian(count-1,h,z+1);
      a[h,z]:=0;
    end;
  end;
end;
begin
  assign(input,'puzzle.in');
  reset(input);
  assign(output,'puzzle.out');
  rewrite(output);
  for i:=1 to 9 do
      for j:=1 to 9 do
      begin
           read(a[i,j]);
           if a[i,j]=0 then inc(count);
      end;
  tian(count,1,1);
  close(input);
  close(output);
end.
