var
  s1,s2:string;
  hh,mm,ss:array[-1..3] of longint;
  aa,bb,cc:longint;
begin
 assign(input,'natrij.in');
 assign(output,'natrij.out');
 reset(input);
 rewrite(output);

 readln(s1);
 readln(s2);
 hh[1]:=(ord(s1[1])-48)*10+(ord(s1[2])-48);
 hh[2]:=(ord(s2[1])-48)*10+(ord(s2[2])-48);
 mm[1]:=(ord(s1[4])-48)*10+(ord(s1[5])-48);
 mm[2]:=(ord(s2[4])-48)*10+(ord(s2[5])-48);
 ss[1]:=(ord(s1[7])-48)*10+(ord(s1[8])-48);
 ss[2]:=(ord(s2[7])-48)*10+(ord(s2[8])-48);
 if ss[2]>=ss[1] then cc:=abs(ss[2]-ss[1]) else cc:=60-abs(ss[2]-ss[1]);bb:=0;
 if mm[2]>=mm[1] then bb:=abs(mm[2]-mm[1])+bb else bb:=60-abs(mm[2]-mm[1]);aa:=0;
 if hh[2]>=hh[1] then aa:=abs(hh[2]-hh[1])+aa else aa:=24-abs((hh[2]-hh[1]))+aa;
 if ss[2]<ss[1] then bb:=bb-1;if mm[2]<mm[1] then aa:=aa-1;
 if bb<0 then aa:=aa-1;
 if aa<10 then write('0',aa,':') else write(aa,':');
 if bb<10 then write('0',bb,':') else write(bb,':');
 if cc<10 then write('0',cc) else write(cc);

 close(input);
 close(output);
end.