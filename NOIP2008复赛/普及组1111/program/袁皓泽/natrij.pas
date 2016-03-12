var s1,s2:string;
    h,m,s,hh,mm,ss,hhh,mmm,sss,extraday,t:longint;
    c:integer;
procedure check(a:longint);
begin
  if a=0 then begin write('00');exit;end;
  if (a div 10=0)and(a mod 10<>0) then write('0',a)
                                  else write(a);
end;
procedure chushi;
begin
  readln(s1);
  s2:='';
  s2:=s2+s1[1]+s1[2];
  val(s2,hh,c);
  s2:='';
  s2:=s2+s1[4]+s1[5];
  val(s2,mm,c);
  s2:='';
  s2:=s2+s1[7]+s1[8];
  val(s2,ss,c);
  readln(s1);
  s2:='';
  s2:=s2+s1[1]+s1[2];
  val(s2,h,c);
  s2:='';
  s2:=s2+s1[4]+s1[5];
  val(s2,m,c);
  s2:='';
  s2:=s2+s1[7]+s1[8];
  val(s2,s,c);
end;
begin
  assign(input,'natrij.in');
  reset(input);
  assign(output,'natrij.out');
  rewrite(output);
  chushi;
  extraday:=0;
  if s>=ss then sss:=s-ss
           else begin
                  s:=s+60;
                  if m>0 then dec(m)
                         else begin
                                m:=m+59;
                                if h>0 then dec(h)
                                       else begin h:=23;end;
                              end;
                  sss:=s-ss;
                end;
  if m>=mm then mmm:=m-mm
           else begin
                  m:=m+60;
                  if h>0 then dec(h)
                         else begin h:=23;end;
                  mmm:=m-mm;
                end;
  if h>=hh then hhh:=h-hh
           else begin h:=h+24;hhh:=h-hh;end;
  check(hhh);
  write(':');
  check(mmm);
  write(':');
  check(sss);
  writeln;
  close(input);
  close(output);
end.