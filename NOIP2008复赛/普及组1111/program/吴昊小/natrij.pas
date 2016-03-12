var h1,h2,h3,m1,m2,m3,s1,s2,s3,i,j,k,s:longint;
    t1,t2,ls1,ls2:string;
begin
  assign(input,'natrij.in');
  reset(input);
  assign(output,'natrij.out');
  rewrite(output);
  readln(t1);
  readln(t2);
  ls1:='';
  ls2:='';
  for i:=1 to 2 do
    begin
      ls1:=ls1+t1[i];
      ls2:=ls2+t2[i];
    end;
  val(ls1,h1);
  val(ls2,h2);
  ls1:='';
  ls2:='';
  for i:=4 to 5 do
    begin
      ls1:=ls1+t1[i];
      ls2:=ls2+t2[i];
    end;
  val(ls1,m1);
  val(ls2,m2);
  ls1:='';
  ls2:='';
  for i:=7 to 8 do
    begin
      ls1:=ls1+t1[i];
      ls2:=ls2+t2[i];
    end;
  val(ls1,s1);
  val(ls2,s2);
  s3:=s2-s1;
  m3:=m2-m1;
  h3:=h2-h1;
  if (s3=0) and (m3=0) and (h3=0) then begin write('24:00:00');close(input);close(output);halt end;
  if s3<0 then begin s3:=s3+60;m3:=m3-1;end;
  if m3<0 then begin m3:=m3+60;h3:=h3-1;end;
  if h3<0 then h3:=h3+24;
  if h3<10 then write('0',h3) else write(h3);
  write(':');
  if m3<10 then write('0',m3) else write(m3);
  write(':');
  if s3<10 then write('0',s3) else write(s3);
  close(input);
  close(output);
end.