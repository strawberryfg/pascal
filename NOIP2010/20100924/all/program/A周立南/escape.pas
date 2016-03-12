var num,dist,e:array [0..301] of longint;
    visit:array [0..301] of boolean;
    a:array [0..301,0..301] of longint;
    w,ent,i,j,n,m,u,v,t,p,ii,k,min,sta,en,now:longint;
    find:boolean;
begin
  assign(input,'escape.in');
  assign(output,'escape.out');
  reset(input);
  rewrite(output);
  readln(n,m);
  for i:=0 to n-1 do read(num[i]);
  readln;
  for i:=0 to n-1 do
    for j:=0 to n-1 do a[i,j]:=maxlongint;
  for i:=1 to m do
    begin
      readln(u,v,t);
      a[u,v]:=t;
      a[v,u]:=t;
    end;
  readln(p);
  for ii:=1 to p do
    begin
      readln(sta,en,w);
      t:=0;
      for i:=0 to n-1 do
        begin
          if ((num[i]<=w) or (i=en)) then begin
                                            inc(t);
                                            if (i=en) then ent:=t;
                                            dist[t]:=a[i,sta];
                                            e[t]:=i;
                                          end;
        end;
      fillchar(visit,sizeof(visit),0);
      k:=0;
      while (k<=t) and (now<>ent) do
        begin
          min:=maxlongint;
          find:=false;
          for i:=1 to t do
            begin
              if (dist[i]<min) and (not(visit[i])) then begin
                                                          min:=dist[i];
                                                          now:=i;
                                                          find:=true;
							end;
            end;
          if not(find) then break;
          visit[now]:=true;
          for i:=1 to t do
            begin
              if i=now then continue;
              if a[now,e[i]]<maxlongint then
                if a[now,e[i]]+dist[now]<dist[i] then dist[i]:=dist[now]+a[now,e[i]];
            end;
          inc(k);
        end;
     if dist[ent]<>maxlongint then writeln(dist[ent])
                              else writeln(-1);
    end;
  close(input);
  close(output);
end.
