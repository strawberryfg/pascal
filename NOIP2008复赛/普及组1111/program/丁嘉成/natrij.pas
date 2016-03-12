var a1,a2,a3,b1,b2,b3,c1,c2,c3:longint;
    a,b:array[1..8]of char;

procedure start;
begin
  assign(input,'natrij.in');
  reset(input);
  assign(output,'natrij.out');
  rewrite(output);
end;

procedure endt;
begin
  close(input);
  close(output);
end;

procedure intt;
var xs:char;
    i:longint;
begin
  for i:=1 to 8 do
    read(a[i]);
  readln;
  for i:=1 to 8 do
    read(b[i]);
  readln;
end;

procedure outt;
begin
  if c1<10 then write('0',c1,':')
           else write(c1,':');
  if c2<10 then write('0',c2,':')
           else write(c2,':');
  if c3<10 then write('0',c3)
           else write(c3);
  writeln;
end;

procedure tryt;
var ta1,ta2,ta3,tc1,tc2,tc3:longint;
begin
  ta1:=24;
  ta2:=0;
  ta3:=0;
  tc1:=0;
  tc2:=0;
  tc3:=0;
  tc3:=tc3+(ta3-a3);
  if tc3<0 then begin
                  dec(tc2);
                  tc3:=tc3+60;
                end;
  tc2:=tc2+(ta2-a2);
  if tc2<0 then begin
                  dec(tc1);
                  tc2:=tc2+60;
                end;
  tc1:=tc1+(ta1-a1);
  c3:=c3+tc3+b3;
  if c3>=60 then begin
                   inc(c2);
                   c3:=c3-60;
                 end;
  c2:=c2+tc2+b2;
  if c2>=60 then begin
                   inc(c1);
                   c2:=c2-60;
                 end;
  c1:=c1+tc1+b1;
end;

procedure runt;
begin
  a1:=(ord(a[1])-48)*10+(ord(a[2])-48);
  a2:=(ord(a[4])-48)*10+(ord(a[5])-48);
  a3:=(ord(a[7])-48)*10+(ord(a[8])-48);
  b1:=(ord(b[1])-48)*10+(ord(b[2])-48);
  b2:=(ord(b[4])-48)*10+(ord(b[5])-48);
  b3:=(ord(b[7])-48)*10+(ord(b[8])-48);
  if a1>b1 then begin
                  tryt;
                  exit;
                end;
  c3:=c3+(b3-a3);
  if c3<0 then begin
                 dec(c2);
                 c3:=c3+60;
               end;
  c2:=c2+(b2-a2);
  if c2<0 then begin
                 dec(c1);
                 c2:=c2+60;
               end;
  c1:=c1+(b1-a1);
end;

begin
start;
intt;
runt;
outt;
endt;
end.