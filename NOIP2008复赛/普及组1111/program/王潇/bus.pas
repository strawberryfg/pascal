Var i,n,d:longint;
    a:array[1..2500]of char;
    dp:array[1..2500,1..3]of longint;

Function check(i:longint):boolean;
begin
  if (dp[i,2]=0)or(dp[i,3]=0)or(abs(dp[i,2]-dp[i,3])<=d) then check:=true else check:=false;
end;

Begin
  assign(input,'bus.in');
  assign(output,'bus.out');
  reset(input);rewrite(output);
  readln(n,d);
  for i:=1 to n do
    read(a[i]);
  close(input);
  dp[1,1]:=1;
  if a[1]='H' then dp[1,2]:=1 else dp[1,3]:=1;
  for i:=2 to n do
    begin
      dp[i,2]:=dp[i-1,2];dp[i,3]:=dp[i-1,3];
      if a[i]='H' then dp[i,2]:=dp[i-1,2]+1 else dp[i,3]:=dp[i-1,3]+1;
      if (not check(i-1))and(not check(i))and(a[i]<>a[i-1]) then begin dp[i,1]:=dp[i-1,1]+1;continue;end;
      if (check(i-1))and(not check(i)) then begin dp[i,1]:=dp[i-1,1]+1;continue;end;
      if (not check(i-1))and(check(i)) then begin dp[i,1]:=dp[i-1,1]-1;continue;end;
      dp[i,1]:=dp[i-1,1];
    end;
  writeln(dp[n,1]);
  close(output);
End.
