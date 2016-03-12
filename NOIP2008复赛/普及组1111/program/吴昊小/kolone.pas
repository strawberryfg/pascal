var n1,n2,i,j,t:longint;
    s,s1,s2,x:string;
    a:array[1..10000] of longint;
    lt:char;
function in1(ch:char):boolean;
var i2:longint;
begin
  in1:=false;
  for i2:=1 to n1 do
    if s1[i2]=ch then begin in1:=true;exit end;
end;
function in2(ch:char):boolean;
var i3:longint;
begin
  in2:=false;
  for i3:=1 to n2 do
    if s2[i3]=ch then begin in2:=true;exit end;
end;
begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
  s1:='';
  s2:='';
  x:='';
  readln(n1,n2);
  readln(x);
  readln(s2);
  readln(t);
  for i:=n1 downto 1 do
    s1:=s1+x[i];
  if (n1=0) and (n2=0) then begin writeln('');close(input);close(output);halt end
  else if n1=0 then begin writeln(s2);close(input);close(output);halt end
          else if n2=0 then begin writeln(s1);close(input);close(output);halt end;
  s:=s1+s2;
  for i:=1 to length(s1) do
    a[i]:=i;
  for i:=1 to t do
    for j:=1 to n1 do
      if (in1(s[a[j]])=true) and (in2(s[a[j]+1])=true) then begin lt:=s[a[j]];s[a[j]]:=s[a[j]+1];s[a[j]+1]:=lt;a[j]:=a[j]+1; end;
  writeln(s);
  close(input);
  close(output);
end.
