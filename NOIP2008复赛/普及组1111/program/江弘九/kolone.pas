var i,j,t,n1,n2,temp:longint;
    s1,s2:string;
    te:char;
    a,f:array[1..10000] of longint;
    s:array[1..10000] of char;
begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
  readln(n1,n2);
  readln(s1);
  readln(s2);
  readln(t);
  s:='';
  for i:=n1 downto 1 do
  begin
    s[n1-i+1]:=s1[i];
    a[n1-i+1]:=1;
  end;
  for i:=1 to n2 do
  begin
    s[n1+i]:=s2[i];
    a[n1+i]:=2;
  end;
  for i:=1 to t do
  begin
    fillchar(f,sizeof(f),0);
    for j:=1 to n1+n2-1 do
    begin
      if (a[j]=2) and (a[j+1]=1) then continue;
      if (a[j]<>a[j+1]) and (f[j]=0) and (f[j+1]=0) then begin
                                                           temp:=a[j];
                                                           a[j]:=a[j+1];
                                                           a[j+1]:=temp;
                                                           te:=s[j];
                                                           s[j]:=s[j+1];
                                                           s[j+1]:=te;
                                                           f[j]:=1;
                                                           f[j+1]:=1;
                                                         end;
    end;
  end;
  for i:=1 to n1+n2 do
    write(s[i]);
  writeln;
  close(input);
  close(output);
end.
