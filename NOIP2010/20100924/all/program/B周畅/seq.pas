var
  n,i,j,ans:longint;
  flag:boolean;
  a,k:array[1..100001]of longint;
begin
  assign(input,'seq.in'); reset(input);
  assign(output,'seq.out'); rewrite(output);
  readln(n);
  flag:=true;
  for i:=1 to n do
    begin
      readln(a[i]);
      if (i>1)and(a[i]<a[i-1]) then flag:=false;
    end;
  if flag=false then begin writeln('0'); halt; end;
  ans:=0;
  for i:=2*a[n]-1 downto a[n] do
    begin
      k[n+1]:=i;
      flag:=true;
      for j:=n downto 1 do
        begin k[j]:=2*a[j]-k[j+1]; if k[j]>k[j+1] then flag:=false; end;
      if flag=true then inc(ans);
    end;
  writeln(ans);
  close(input);
  close(output);
end.