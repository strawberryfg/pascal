var time,num,t,m,s:longint;
    i,j:longint;
    big,temp:array[0..1000] of longint;
function max(a,b:longint):longint;
begin
  if a>b then max:=a
         else max:=b
end;
procedure setup;
const filename='medic';
begin
  assign(input,filename+'.in');
  assign(output,filename+'.out');
  reset(input);
  rewrite(output)
end;
procedure endit;
begin
  close(input);
  close(output)
end;

begin
  setup;
  readln(time,num);
  fillchar(big,sizeof(big),0);
  for i:=1 to num do
  begin
    fillchar(temp,sizeof(temp),0);
    readln(t,m);
    temp[t]:=m;
    for j:=1 to (time-t) do if big[j]>0 then temp[j+t]:=big[j]+m;
    for j:=0 to time do big[j]:=max(big[j],temp[j])
  end;
  s:=0;
  for i:=0 to time do if big[i]>s then s:=big[i];
  writeln(s);
  endit
end.