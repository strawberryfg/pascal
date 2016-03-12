program message(input,output);
  var
    n,m,i,a,b:longint;
    ok:array [0..1001,0..1001] of boolean;
    visit:array [0..1001] of integer;
  procedure dfs(i:longint);
    var
      k:longint;
    begin
      inc(visit[i]);
      for k:=1 to n do
        if (ok[i,k]) and (visit[k]<2) then dfs(k);
    end;
  begin
    assign(input,'message.in');
    assign(output,'message.out');
    reset(input);
    rewrite(output);
    readln(n,m);
    fillchar(ok,sizeof(ok),false);
    fillchar(visit,sizeof(visit),0);
    for i:=1 to m do
      begin
        readln(a,b);
        ok[a,b]:=true;
      end;
    dfs(1);
    for i:=1 to n do
      if visit[i]=2 then writeln('T')
        else writeln('F');
    close(input);
    close(output);
  end.
