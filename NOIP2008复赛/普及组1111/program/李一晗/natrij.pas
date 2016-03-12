var t1,t2:string;
    h1,h2,m1,m2,s1,s2,h3,m3,s3,k,c,h4,m4,s4:longint;
    z1,z2,z3:string;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
  readln(t1);
  readln(t2);
  h1:=(ord(t1[1])-ord('0'))*10+ord(t1[2])-ord('0');
  h2:=(ord(t2[1])-ord('0'))*10+ord(t2[2])-ord('0');
  m1:=(ord(t1[4])-ord('0'))*10+ord(t1[5])-ord('0');
  m2:=(ord(t2[4])-ord('0'))*10+ord(t2[5])-ord('0');
  s1:=(ord(t1[7])-ord('0'))*10+ord(t1[8])-ord('0');
  s2:=(ord(t2[7])-ord('0'))*10+ord(t2[8])-ord('0');
  if (h1=h2)and(s1=s2)and(m1=m2) then writeln('00:00:00')
  else
    begin
      if (h2<h1)or((h2=h1)and(m1<m2))or((h2=h1)and(m2=m1)and(s2<s1)) then
        begin
          k:=1;
          c:=1;
          s4:=60-s1;
          if s4=60 then s4:=0;
          if s1=0 then k:=0;
          if m1=0 then c:=0;
          m4:=60-m1-k;
          if m4=60 then m4:=0;
          h4:=24-h1-1;
          if (c=0)and(k=0) then h4:=24-h1;
          c:=0;
          k:=0;
          s3:=s2+s4;
          if s3>60 then
                   begin
                     s3:=s3-60;
                     k:=1;
                   end;
          m3:=m2+m4+k;
          if m3>60 then
                   begin
                     m3:=m3-60;
                     c:=1;
                   end;
          h3:=h2+h4+c;
        end else
            begin
              k:=0;
              c:=0;
              if s2<s1 then begin
                              k:=1;
                              s3:=s2+60-s1;
                            end else s3:=s2-s1;
              if m2-k<m1 then begin
                                c:=1;
                                m3:=m2-k+60-m1;
                              end else m3:=m2-k-m1;
              h3:=h2-c-h1;
            end;
       z1:='';
       z2:='';
       z3:='';
       if h3<10 then z1:='0';
       if m3<10 then z2:='0';
       if s3<10 then z3:='0';
       writeln(z1,h3,':',z2,m3,':',z3,s3);
    end;
close(input);
close(output);
end.
