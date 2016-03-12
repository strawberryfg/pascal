program BUSczt;

var  dp:array[-1..10000] of longint;
     n,d,i,l,minnum,tj,th,k,mh,mj:longint;
     s:string;
     h,j:array[1..10000] of longint;


function min(a,b:longint):longint;
  begin
    if a<b then min:=a
           else min:=b;
  end;


begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);

  readln(n,d);
  readln(s);
  th:=0;
  tj:=0;
  for i:=1 to n do
      begin
        if s[i]='H'
           then th:=th+1
           else tj:=tj+1;
        h[i]:=th;
        j[i]:=tj;
      end;
  dp[0]:=0;
  dp[1]:=1;
  for i:=2 to n do
      begin
        minnum:=dp[i-1]+1;
        for l:=1 to i-1 do
            begin
              if s[l]='H'
                 then k:=abs((h[i]-h[l]+1)-(j[i]-j[l]))
                 else k:=abs((h[i]-h[l])-(j[i]-j[l]+1));
              {if s[l]='H'
                 then begin
                        mh:=h[i]-h[l]+1;
                        mj:=j[i]-j[l];
                      end
                 else begin
                        mh:=h[i]-h[l];
                        mj:=j[i]-j[l]+1;
                      end;}
              if k<=d then minnum:=min(minnum,dp[l-1]+1)
                      else if (h[i]=h[l]) or (j[i]=j[l]) then
                              minnum:=min(minnum,dp[l-1]+1);
            end;
        dp[i]:=minnum;
      end;
  writeln(dp[n]);

close(input);
close(output);
end.
