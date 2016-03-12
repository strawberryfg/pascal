var s1,s2,s:string;
    c:array[1..260]of boolean;
    n1,n2,t,i,j,k,po:integer;
    temp:char;
function ini(d1,d2:string):boolean;
var i,j:integer;
begin
  if pos(d1,d2)=0 then ini:=false else ini:=true;
end;
begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
  readln(n1,n2);
  readln(s1); readln(s2); readln(t); s:='';
  for i:=1 to length(s1) do s:=s+s1[length(s1)-i+1];
  s:=s+s2;
  if t<>0 then begin
  for i:=1 to t do
  begin
    k:=1; fillchar(c,sizeof(c),true);
    for j:=1 to length(s) do
    begin
      if (ini(s[j],s1))and(ini(s[j+1],s2))and(c[j]=true)and(c[j+1]=true)
      then begin temp:=s[j]; s[j]:=s[j+1]; s[j+1]:=temp; c[j]:=false; c[j+1]:=false;
      if j=length(s) div 2 then po:=j; end
      else if (ini(s[j],s2))and(ini(s[j-1],s1))and(j-1<>po)and(c[j]=true)and(c[j-1]=true)
      then begin temp:=s[j-1]; s[j-1]:=s[j]; s[j]:=temp; c[j]:=false; c[j-1]:=false;
      while ini(s[k],s2) do inc(k);
      if k=j then break;
    end;
  end; end;
  end;
  writeln(s); close(input); close(output);
end.
