program ghillie(input,output);
  var
    num:array [0..201] of longint;
    use:array [0..201] of boolean;
    re:ansistring;
    i,j,k,l,n,max,t,r,v,total:longint;
  begin
    assign(input,'ghillie.in');
    assign(output,'ghillie.out');
    reset(input);
    rewrite(output);
    fillchar(use,sizeof(use),true);
    readln(n);
    readln(re);
    re:=re+' ';
    i:=1;j:=1;k:=length(re);
    while (i<=k) and (re[i]<>' ') do
      begin
        while re[i]<>' ' do
          begin
            num[j]:=num[j]*10+ord(re[i])-ord('0');
            inc(i);
          end;
        inc(j);
        inc(i);
      end;
    max:=j-1;
    for i:=2 to max do
      for j:=1 to i-1 do
        if num[i]<num[j] then
          begin
            k:=num[i];
            num[i]:=num[j];
            num[j]:=k;
          end;
        for k:=1 to n do
            for j:=1 to max do
                begin
                  total:=0;
                  t:=num[j];
                  while t>0 do
                    begin
                      l:=t mod 10;r:=l;
                      for v:=1 to k do
                        r:=r*l;
                      total:=total+r;
                      t:=t div 10;
                    end;
                  for v:=1 to max do
                    if num[v]=total then
                      use[v]:=false;
                end;
    i:=1;
    while not use[i] do inc(i);
    write(num[i]);
    for j:=i+1 to max do
      if use[j] then write(' ',num[j]);
    writeln;
    close(input);
    close(output);
  end.