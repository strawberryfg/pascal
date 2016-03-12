var s,s1,s2,s3:string;
    p1,p2,a,b:longint;
begin
  assign(input,'add.in');
  assign(output,'add.out');
  reset(input);
  rewrite(output);
  readln(s);
  p1:=pos('+',s);
  p2:=pos('=',s);
  s1:=copy(s,1,p1-1);
  s2:=copy(s,p1+1,p2-p1-1);
  s3:=copy(s,p2+1,length(s)-p2);
  if s1[1] in ['a'..'z'] then
    begin
      val(s2,a);val(s3,b);
      writeln(s1[1],'=',b-a);
    end;
  if s2[1] in ['a'..'z'] then
    begin
      val(s1,a);val(s3,b);
      writeln(s2[1],'=',b-a);
    end;
  if s3[1] in ['a'..'z'] then
    begin
      val(s1,a);val(s2,b);
      writeln(s3[1],'=',a+b);
    end;
  close(input);
  close(output);
end.
