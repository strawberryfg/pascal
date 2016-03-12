var visit:array [0..20] of boolean;
    t:array [0..20,0..20] of longint;
    i,j,n,ans:longint;

procedure search(now,dep:longint);
var i,j:longint;
begin
  if (now<ans) and (dep=n div 2) then ans:=now;
  for i:=1 to n do
    for j:=1 to n do
      begin
        if (i=j) then continue;
        if (not(visit[i])) and (not(visit[j])) then begin
                                                      if (now+t[i,j]>ans) then continue;
                                                      visit[i]:=true;
                                                      visit[j]:=true;
                                                      search(now+t[i,j],dep+1);
                                                      visit[i]:=false;
                                                      visit[j]:=false;
                                                    end;
     end;
end;

begin
  assign(input,'spring.in');
  assign(output,'spring.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to n do read(t[i,j]);
      readln;
    end;
  ans:=maxlongint;
  fillchar(visit,sizeof(visit),0);
  search(0,0);
  writeln(ans);
  close(input);
  close(output);
end.