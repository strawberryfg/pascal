program tree(input,output);
  var
    st:string;
    n,i,j,k,max,len:longint;
    ok:array [0..101,0..101] of boolean;
    f,num:array [0..101] of longint;
  begin
    assign(input,'tree.in');
    assign(output,'tree.out');
    reset(input);
    rewrite(output);
    readln(n);
    for i:=1 to n do
      begin
        readln(st);
        st:=st+' ';
        k:=1;
        len:=length(st);
        while st[k]<>' ' do
          begin
            num[i]:=num[i]*10+ord(st[k])-ord('0');
            inc(k);
          end;
        inc(k);
        while (k<=len) and (st[k]<>' ') do
          begin
            j:=0;
            while st[k]<>' ' do
              begin
                j:=j*10+ord(st[k])-ord('0');
                inc(k);
              end;
            ok[i,j]:=true;
            ok[j,i]:=true;
            inc(k);
          end;
      end;
    f[n]:=num[n];
    for i:=n-1 downto 1 do
      begin
        f[i]:=num[i];
        for j:=n downto i+1 do
          if ok[i,j] then
            if f[j]+num[i]>f[i]
              then f[i]:=f[j]+num[i];
      end;
    max:=0;
    for i:=1 to n do
      if f[i]>max then max:=f[i];
    writeln(max);
    close(input);
    close(output);
  end.
