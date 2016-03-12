var hh1,mm1,ss1,hh2,mm2,ss2,hh3,mm3,ss3,i:longint;
    s,s1:string;
begin
  assign(input,'natrij.in');
  reset(input);
  assign(output,'natrij.out');
  rewrite(output);
  readln(s); s1:=copy(s,1,2); val(s1,hh1);
  s1:=copy(s,4,2); val(s1,mm1); s1:=copy(s,7,2); val(s1,ss1);
  readln(s); s1:=copy(s,1,2); val(s1,hh2);
  s1:=copy(s,4,2); val(s1,mm2); s1:=copy(s,7,2); val(s1,ss2);
  for i:=1 to 2 do if (hh2<hh1)or(hh1<12) then hh2:=hh2+12;
  if ss2<ss1 then begin ss2:=ss2+60; dec(mm2); end;
  if mm2<mm1 then begin mm2:=mm2+60; dec(hh2); end;
  ss3:=ss2-ss1; mm3:=mm2-mm1; hh3:=hh2-hh1;
  if hh3<=9 then write('0',hh3,':') else write(hh3,':');
  if mm3<=9 then write('0',mm3,':') else write(mm3,':');
  if ss3<=9 then write('0',ss3) else writeln(ss3);
  close(input); close(output);
end.
