const
     maxn=30;
var
     i,n,m,k,x,s,j,sum:longint;
     sr,sp:array[1..maxn] of longint;
procedure try(dep,d:longint);
begin
     if s=n then inc(sum)
            else begin
                 s:=d;
                 for j:=1 to dep-1 do
                     s:=s+sp[j];
                 if (sr[s]<>0)and(s<=n)and(d<=3) then begin
                                                      sp[dep]:=i;
                                                      try(dep+1,1);
                                                      end
                                                 else begin
                                                      s:=s-d;
                                                      try(dep,d+1);
                                                      try(dep-1,sp[dep-1]+1);
                                                      end;
                 end;
end;
begin
     assign(input,'stair.in');
     reset(input);
     assign(output,'stair.out');
     rewrite(output);
     readln(n);
     readln(k);
     for i:=1 to maxn do
         sr[i]:=1;
     for i:=1 to k do
         begin
         readln(x);
         sr[x]:=0;
         end;
     sum:=0;
     try(1,1);
     writeln(sum);
     close(input);
     close(output);
end.
