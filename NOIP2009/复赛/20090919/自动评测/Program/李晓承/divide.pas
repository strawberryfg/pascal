program asdf;
var
    d:array[0..10000]of longint;
    dp:array[0..10000]of int64;
    temp,c:int64;
    i,j,n,k:longint;
procedure sort(l,r:longint);
    var
      i,j,temp,m:longint;
    begin
      i:=l;j:=r;m:=d[(l+r) div 2];
      repeat
        while d[i]<m do inc(i);
        while d[j]>m do dec(j);
        if i<=j then
          begin
           temp:=d[i];d[i]:=d[j];d[j]:=temp;
           inc(i);dec(j);
          end;
      until i>j;
      if l<j then sort(l,j);
      if i<r then sort(i,r);
    end;
begin
    assign(input,'divide.in');reset(input);
    assign(output,'divide.out');rewrite(output);
    readln(n,k,c);
    for i:=1 to n do read(d[i]);
    readln;
    sort(1,n);
    dp[0]:=0;
    for i:=k to n do
      begin
        dp[i]:=d[i]-d[1];
        dp[i]:=dp[i]*dp[i];
        dp[i]:=c+dp[i];
        for j:=i-k+1 downto k+1 do
          begin
            temp:=d[i]-d[j];
            temp:=temp*temp;
            temp:=dp[j-1]+c+temp;
            if temp<=dp[i] then dp[i]:=temp;
          end;
      end;
    writeln(dp[n]);
    close(input);close(output);
end.
