var count11,count12,count13,count21,count22,count23,
    dan,dan1,dan2,dan3,i,tou,wei:longint;
    before,now:string;
begin
  assign(input,'natrij.in'); reset(input);
  assign(output,'natrij.out'); rewrite(output);
  readln(before);
  readln(now);
  for i:=1 to 2 do
  begin
    count11:=count11*10+ord(before[i])-48;
    count21:=count21*10+ord(now[i])-48;
  end;
  for i:=4 to 5 do
  begin
    count12:=count12*10+ord(before[i])-48;
    count22:=count22*10+ord(now[i])-48;
  end;
  for i:=7 to 8 do
  begin
    count13:=count13*10+ord(before[i])-48;
    count23:=count23*10+ord(now[i])-48;
  end;
  tou:=count11*3600+count12*60+count13;
  wei:=count21*3600+count22*60+count23;
  if tou>wei then wei:=wei+24*3600;
  dan:=wei-tou;
  dan1:=dan div 3600;
  dan2:=(dan mod 3600)div 60;
  dan3:=dan mod 60;
  if dan1<10 then write(0,dan1,':') else write(dan1,':');
  if dan2<10 then write(0,dan2,':') else write(dan2,':');
  if dan3<10 then writeln(0,dan3) else writeln(dan3);
  close(input); close(output);
end.