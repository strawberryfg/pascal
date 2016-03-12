var str1,str2:string;
    h1,h2,h3,m1,m2,m3,s1,s2,s3:longint;

begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
    readln(str1);
    readln(str2);
    h1:=(ord(str1[1])-ord('1')+1)*10+ord(str1[2])-ord('1')+1;
    m1:=(ord(str1[4])-ord('1')+1)*10+ord(str1[5])-ord('1')+1;
    s1:=(ord(str1[7])-ord('1')+1)*10+ord(str1[8])-ord('1')+1;
    h2:=(ord(str2[1])-ord('1')+1)*10+ord(str2[2])-ord('1')+1;
    m2:=(ord(str2[4])-ord('1')+1)*10+ord(str2[5])-ord('1')+1;
    s2:=(ord(str2[7])-ord('1')+1)*10+ord(str2[8])-ord('1')+1;
    if s2>=s1 then s3:=s2-s1
              else s3:=s2-s1+60;
    if m2>m1 then if s2>=s1 then m3:=m2-m1
                            else m3:=m2-m1-1
             else if s2>s1 then m3:=m2-m1+60
                           else if s2=s1 then m3:=m2-m1
                                         else m3:=m2-m1+59;
    if m2>m1 then h3:=h2-h1
             else if (m2=m1)and(s2>=s1)then h3:=h2-h1
                                       else h3:=h2-h1-1;
    if h3<0 then h3:=h3+24;
    if h3<10 then write('0',h3)
             else write(h3);
    write(':');
    if m3<10 then write('0',m3)
             else write(m3);
    write(':');
    if s3<10 then write('0',s3)
             else write(s3);
    writeln;
close(input);
close(output);
end.