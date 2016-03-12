var a,b,c,i,j,k:integer;
    s:array[1..1000]of integer;
begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  i:=0;
  while not eoln do
  begin
    inc(i);
    read(s[i]);
    if s[i]=1 then begin  writeln('1'); close(input); close(output); halt; end;
  end;
  j:=1; k:=j+1;
  while j<i do
    begin
      if s[j] mod s[k]=0 then begin inc(j); inc(k); continue; end;
      if s[k] mod s[j]=0 then
      begin s[k]:=s[k] mod s[j];  inc(j); inc(k);continue; end;
      if s[j]>s[k] then begin
                          a:=s[j]; b:=s[k];
                          repeat
                            c:=a mod b;
                            a:=b;
                            b:=c;
                          until a mod b=0;
                          s[k]:=b;
                          if s[k]=1 then
                          begin writeln('1'); close(input); close(output); halt; end
                          else begin inc(j); inc(k); end
                        end
                   else begin
                          a:=s[k]; b:=s[j];
                          repeat
                            c:=a mod b;
                            a:=b;
                            b:=c;
                          until a mod b=0;
                          s[k]:=b;
                          if s[k]=1 then
                          begin writeln('1'); close(input); close(output); halt; end
                          else begin inc(j); inc(k); end;
                        end;
    end;
  writeln(s[i]);
  close(input);
  close(output);
end.
