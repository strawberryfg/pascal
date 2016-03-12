var a,b,c:longint;
    f:array[-100..100,-100..100,-100..100]of longint;
procedure setup;
begin
  assign(input,'function.in');
  reset(input);
  assign(output,'function.out');
  rewrite(output);
end;
procedure endit;
begin
  close(input);
  close(output);
end;
function w(a,b,c:longint):longint;
begin
  if f[a,b,c]<>-maxlongint then exit(f[a,b,c]);
  if(a<=0)or(b<=0)or(c<=0)then begin f[a,b,c]:=1;exit(1) end;
  if(a>20)or(b>20)or(c>20)then begin f[a,b,c]:=w(20,20,20);exit(f[a,b,c]);end;
  f[a,b,c]:=w(a-1,b,c)+w(a-1,b-1,c)+w(a-1,b,c-1)-w(a-1,b-1,c-1);
  w:=f[a,b,c];
end;
begin
  setup;
  readln(a,b,c);
  filldword(f,sizeof(f)div 4,-maxlongint);
  w(a,b,c);
  writeln('w(',a,', ',b,', ',c,') = ',f[a,b,c]);
  endit;
end.
