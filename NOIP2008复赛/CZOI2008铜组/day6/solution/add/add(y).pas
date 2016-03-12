program add;
var
  s,s1,s2,s3:string;
  p,x1,x2,x3:longint;

begin
  assign(input,'add.in');
  reset(input);
  assign(output,'add.out');
  rewrite(output);

  readln(s);
  p:=pos('+',s);
  s1:=copy(s,1,p-1);
  delete(s,1,p);
  p:=pos('=',s);
  s2:=copy(s,1,p-1);
  delete(s,1,p);
  s3:=s;
  if (s1='a') or (s1='b') or (s1='c')
  then begin
         val(s3,x3);
         val(s2,x2);
         writeln(s1,'=',x3-x2);
       end;
  if (s2='a') or (s2='b') or (s2='c')
  then begin
         val(s1,x1);
         val(s3,x3);
         writeln(s2,'=',x3-x1);
       end;
  if (s3='a') or (s3='b') or (s3='c')
  then begin
         val(s1,x1);
         val(s2,x2);
         writeln(s3,'=',x1+x2);
       end;

  close(input);
  close(output);
end.
