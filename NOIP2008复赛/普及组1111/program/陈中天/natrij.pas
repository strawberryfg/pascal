program NATRIJczt;

var hour1,hour2,min1,min2,sec1,sec2,anshour,ansmin,anssec:longint;
    ss,s,s1,sh,sm,s2:string;

begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);

  readln(s1);
  sh:=s1[1]+s1[2];
  hour1:=hour1*10+ord(sh[1])-48;
  hour1:=hour1*10+ord(sh[2])-48;
  sm:=s1[4]+s1[5];
  min1:=min1*10+ord(sm[1])-48;
  min1:=min1*10+ord(sm[2])-48;
  ss:=s1[7]+s1[8];
  sec1:=sec1*10+ord(ss[1])-48;
  sec1:=sec1*10+ord(ss[2])-48;


  readln(s2);
  sh:=s2[1]+s2[2];
  hour2:=hour2*10+ord(sh[1])-48;
  hour2:=hour2*10+ord(sh[2])-48;
  sm:=s2[4]+s2[5];
  min2:=min2*10+ord(sm[1])-48;
  min2:=min2*10+ord(sm[2])-48;
  ss:=s2[7]+s2[8];
  sec2:=sec2*10+ord(ss[1])-48;
  sec2:=sec2*10+ord(ss[2])-48;


  anssec:=sec2-sec1;
  if anssec<0 then begin anssec:=60-abs(anssec);min2:=min2-1;end;
  ansmin:=min2-min1;
  if ansmin<0 then begin ansmin:=60-abs(ansmin);hour2:=hour2-1;end;
  if hour2<hour1 then hour2:=hour2+24;
  anshour:=hour2-hour1;
  if anshour<10 then write('0');
  write(anshour);
  write(':');
  if ansmin<10 then write('0');
  write(ansmin);
  write(':');
  if anssec<10 then write('0');
  write(anssec);
  writeln;

close(input);
close(output);
end.
