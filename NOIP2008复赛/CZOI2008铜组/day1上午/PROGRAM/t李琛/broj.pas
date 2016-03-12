var k,m,i,j,n,s:longint;
    b:array[1..10]of integer;
begin
    assign(input,'broj.in');
    reset(input);
    assign(output,'broj.out');
    rewrite(output);
    readln(n);
    s:=0;
    k:=1;
    m:=1;
    for i:= 1 to 10 do
    b[i]:= 1;
    for i:=1 to 10 do
      begin
      k:=k*10;
      if n div k =0 then begin
                            for j:= 1 to i do
                              begin
                                s:= s+n-m+1;
                                m:=m*10;
                              end;
                         writeln(s);
                         close(input);
                         close(output);
                         halt;
                         end;
      end;
end.
