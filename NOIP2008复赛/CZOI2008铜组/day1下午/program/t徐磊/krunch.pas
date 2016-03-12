var a:array['A'..'Z']of boolean;
     s:string;
     i:longint;
     temp:char;
     PD:BOOLEAN;
begin
  assign(input,'krunch.in');reset(input);
  assign(output,'krunch.out');rewrite(output);
  fillchar(a,sizeof(a),true);
  A['A']:=FALSE;
  A['E']:=FALSE;
  A['I']:=FALSE;
  A['O']:=FALSE;
  A['U']:=FALSE;
  s:='';
  while not(eoln) do
  begin
    read(temp);
    PD:=((temp=' ')and(temp<>s[length(s)]))OR((TEMP<>' ')AND(temp<>',')and(temp<>'.')and(temp<>'?')and(A[TEMP]))or((temp=',')or(temp='.')or(temp='?'));
    if PD then begin s:=s+temp;IF (TEMP<>' ' )and(temp<>'.')and(temp<>'?')THEN a[temp]:=false;end;
  end;
  for i:=1 to length(s) do
     if ((s[i]=',')or(s[i]='.')or(s[i]='?'))and(s[i-1]=' ') then delete(s,i-1,1);
  if s[1]=' 'then delete(s,1,1);
  if s[length(s)]=' ' then delete(s,length(s),1);
  writeln(s);
  close(input);
  close(output);
end.
