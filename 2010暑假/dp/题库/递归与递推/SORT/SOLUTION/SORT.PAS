program pro1;
  type arr=array[0..31]of longint;
  var a:arr;
      n,i,j,k:longint;
  begin
    assign(input,'sort.in');
    assign(output,'sort.out');
    reset(input); rewrite(output);
    read(n,k);
    fillchar(a,sizeof(a),0);
    a[n]:=1; a[0]:=1;
    for i:=n-1 downto 1 do
      a[i]:=a[i+1]*2;
    i:=0; j:=1;
    while k>1 do
      begin
        while (i<=n) and (k>a[i]) do
          begin
            dec(k,a[i]);
            inc(i)
          end;
        if j<>1 then write(' ');
        inc(j);
        write(i);
        a[i]:=1
      end;
    if i=0 then writeln(0);
    close(input);
    close(output)
  end.