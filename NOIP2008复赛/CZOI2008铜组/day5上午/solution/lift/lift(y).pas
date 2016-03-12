program lift;
var
  s,aa,bb,step:array[1..200] of integer;
  flag:boolean;
  n,a,b,i,j,k,x:integer;

begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);

  readln(n,a,b);
  if a=b
  then begin
         writeln(0);
         close(input);
         close(output);
         halt;
       end;
  for i:=1 to n do
    read(aa[i]);
  fillchar(bb,sizeof(bb),0);
  fillchar(step,sizeof(step),0);
  s[1]:=a;
  bb[1]:=1;
  i:=1;
  j:=1;
  flag:=true;
  while (i<=j) and flag do
  begin
    for k:=1 to 2 do
    begin
      if k=1
      then x:=s[i]-aa[s[i]]
      else x:=s[i]+aa[s[i]];
      if x=b
      then begin
             writeln(step[s[i]]+1);
             flag:=false;
           end;
      if (x>0) and (x<=n) and (bb[x]=0) and flag
      then begin
             inc(j);
             s[j]:=x;
             bb[x]:=1;
             step[i]:=step[i]+1;
           end;
    end;
    inc(i);
  end;
  if flag
  then writeln(-1);

  close(input);
  close(output);
end.