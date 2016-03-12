var time1,time2:string;
    h,m,s,h1,h2,m1,m2,s1,s2:longint;
begin
  assign(input,'natrij.in');
  reset(input);
  assign(output,'natrij.out');
  rewrite(output);
  readln(time1);
  readln(time2);
  h1:=(ord(time1[1])-48)*10+ord(time1[2])-48;
  h2:=(ord(time2[1])-48)*10+ord(time2[2])-48;
  m1:=(ord(time1[4])-48)*10+ord(time1[5])-48;
  m2:=(ord(time2[4])-48)*10+ord(time2[5])-48;
  s1:=(ord(time1[7])-48)*10+ord(time1[8])-48;
  s2:=(ord(time2[7])-48)*10+ord(time2[8])-48;
  if (h1*10000+m1*100+s1)=(h2*10000+m2*100+s2) then writeln('00:00:00');
  if (h1*10000+m1*100+s1)<(h2*10000+m2*100+s2) then begin
                                                      s:=s2-s1;
                                                      if s<0 then begin
                                                                    s:=s+60;
                                                                    m2:=m2-1;
                                                                  end;
                                                      m:=m2-m1;
                                                      if m<0 then begin
                                                                    m:=m+60;
                                                                    h2:=h2-1;
                                                                  end;
                                                      h:=h2-h1;
                                                      if h<10 then write('0',h) else write(h);
                                                      if m<10 then write(':0',m) else write(':',m);
                                                      if s<10 then writeln(':0',s) else writeln(':',s);
                                                      close(input);
                                                      close(output);
                                                      exit;
                                                    end;
  if (h1*10000+m1*100+s1)>(h2*10000+m2*100+s2) then begin
                                                      h2:=h2+24;
                                                      s:=s2-s1;
                                                      if s<0 then begin
                                                                    s:=s+60;
                                                                    m2:=m2-1;
                                                                  end;
                                                      m:=m2-m1;
                                                      if m<0 then begin
                                                                    m:=m+60;
                                                                    h2:=h2-1;
                                                                  end;
                                                      h:=h2-h1;
                                                      if h<10 then write('0',h) else write(h);
                                                      if m<10 then write(':0',m) else write(':',m);
                                                      if s<10 then writeln(':0',s) else writeln(':',s);
                                                      close(input);
                                                      close(output);
                                                      exit;
                                                    end;
  close(input);
  close(output);
end.


