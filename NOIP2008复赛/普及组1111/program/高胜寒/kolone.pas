var a,b,time,times,count,j,p,i,come,c:longint;
    s1,s2,jump,ff:string;
    ji,lu,now:array[1..1000]of string;
begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
  readln(a,b);
  readln(s1);
  readln(s2);
  for i:=length(s1) downto 1 do
  begin
    j:=j+1;
    ji[j]:=s1[i];
    now[j]:=ji[j];
  end;
  for i:=1 to length(s2) do
  begin
    p:=p+1;
    lu[p]:=s2[i];
    now[j+p]:=lu[p];
  end;
  readln(times); count:=j+p;
  while time<times do
  begin
    come:=2;
    c:=0;
    while come<=count do
    begin
      ff:='houu';
      c:=0;
      for i:=1 to j do
        if (now[come]=ji[i])or(now[come-1]=ji[i]) then
        begin
          if now[come-1]=ji[i] then ff:='xian';
          c:=c+1;
        end;
      for i:=1 to p do
        if (now[come]=lu[i])or(now[come-1]=lu[i]) then c:=c-1;
      if (c=0)and(ff='xian') then
      begin
        jump:=now[come];
        now[come]:=now[come-1];
        now[come-1]:=jump;
        come:=come+2;
      end else come:=come+1;
    end;
    time:=time+1;
  end;
  for i:=1 to count do
      write(now[i]);
  writeln;
  close(input);
  close(output);
end.
