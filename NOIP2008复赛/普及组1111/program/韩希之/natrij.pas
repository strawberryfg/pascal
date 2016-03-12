Var h1,m1,s1,h2,m2,s2,t1,t2:longint;
    s3,s4:string;
    code:integer;
Function trans(k:longint):string;
         var h,m,s:longint;
             s1,s2,s3:string;
         begin
           h:=k div 3600;
           m:=k div 60 mod 60;
           s:=k mod 60;
           str(h,s1);str(m,s2);str(s,s3);
           if length(s1)<2 then s1:='0'+s1;
           if length(s2)<2 then s2:='0'+s2;
           if length(s3)<2 then s3:='0'+s3;
           trans:=s1+':'+s2+':'+s3;
         end;
Begin
  assign(input,'natrij.in');
  assign(output,'natrij.out');
  reset(input);rewrite(output);
  readln(s3);
  readln(s4);
  val(copy(s3,1,2),h1,code);
  val(copy(s3,4,2),m1,code);
  val(copy(s3,7,2),s1,code);
  val(copy(s4,1,2),h2,code);
  val(copy(s4,4,2),m2,code);
  val(copy(s4,7,2),s2,code);
  t1:=h1*3600+m1*60+s1;
  t2:=h2*3600+m2*60+s2;
  if t2>t1 then writeln(trans(t2-t1))
     else writeln(trans(24*3600-t1+t2));
  close(input);close(output);
End.