var
  t,i,j:longint;
  s:char;
  a1,a2:longint;
  x,y,a,b:array[0..100] of longint;

function check:boolean;
var
  i,j:longint;
  used1,used2:array[0..9] of boolean;
begin
  fillchar(used1,sizeof(used1),0);
  fillchar(used2,sizeof(used2),0);

  for i:=1 to a1 do
    used1[a[i]]:=true;
  for i:=1 to a2 do
    used2[b[i]]:=true;

  for i:=0 to 9 do
    if used1[i]<>used2[i] then
      exit(false);

  exit(true);
end;

procedure doit;
var
  i,j:longint;
  ljr:boolean;
begin
  ljr:=false;

  if a1>1 then
  begin
   if (a[1]<>1)and(a[1]<>0)and(a[2]<>9) then
   begin
     dec(a[1]);
     inc(a[2]);
     ljr:=ljr or check;
     inc(a[1]);
     dec(a[2]);
   end;
   if (a[1]<>9)and(a[2]<>0) then
   begin
     inc(a[1]);
     dec(a[2]);
     ljr:=ljr or check;
     dec(a[1]);
     inc(a[2]);
   end;

   for i:=3 to a1 do
   begin
     if (a[i-1]<>0)and(a[i]<>9) then
     begin
       dec(a[i-1]);
       inc(a[i]);
       ljr:=ljr or check;
       inc(a[i-1]);
       dec(a[i]);
     end;

     if (a[i-1]<>9)and(a[i]<>0) then
     begin
       inc(a[i-1]);
       dec(a[i]);
       ljr:=ljr or check;
       dec(a[i-1]);
       inc(a[i]);
     end;
   end;
  end;

  if a2>1 then
  begin
   if (b[1]<>1)and(b[1]<>0)and(b[2]<>9) then
   begin
     dec(b[1]);
     inc(b[2]);
     ljr:=ljr or check;
     inc(b[1]);
     dec(b[2]);
   end;
   if (b[1]<>9)and(b[2]<>0) then
   begin
     inc(b[1]);
     dec(b[2]);
     ljr:=ljr or check;
     dec(b[1]);
     inc(b[2]);
   end;

   for i:=3 to a2 do
   begin
     if (b[i-1]<>0)and(b[i]<>9) then
     begin
       dec(b[i-1]);
       inc(b[i]);
       ljr:=ljr or check;
       inc(b[i-1]);
       dec(b[i]);
     end;

     if (b[i-1]<>9)and(b[i]<>0) then
     begin
       inc(b[i-1]);
       dec(b[i]);
       ljr:=ljr or check;
       dec(b[i-1]);
       inc(b[i]);
     end;
   end;

  end;

  if ljr=true then
    writeln('almost friends')
  else
    writeln('nothing');
end;

begin
  assign(input,'friends.in');
  reset(input);
  assign(output,'friends.out');
  rewrite(output);

  readln(t);

  for i:=1 to t do
  begin
    a1:=0;a2:=0;
    repeat
      read(s);
      if s<>' ' then
      begin
        inc(a1);
        x[a1]:=ord(s)-48;
      end;
    until(s=' ');

    repeat
      read(s);
      inc(a2);
      y[a2]:=ord(s)-48;
    until(eoln);
    readln;


    for j:=1 to a1 do
      a[j]:=x[j];
    for j:=1 to a2 do
      b[j]:=y[j];

    if check=true then
      writeln('fridends')
    else
      doit;

  end;

  close(input);
  close(output);
end.






















