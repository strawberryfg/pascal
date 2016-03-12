program best(input,output);
  var
    i,j,k,n,max,now:longint;
  begin
    assign(input,'best.in');
    assign(output,'best.out');
    reset(input);
    rewrite(output);
    readln(n);
    i:=2;
    max:=n;
    while i<n do
      begin
        now:=1;
        k:=n div (n div i);
        if abs(k*(n div i)-n)<>1 then
          begin
            for j:=1 to k do
               now:=now*(n div i);
            if abs(n-k*(n div i))<>0 then now:=now*(n-k*(n div i));
          end
        else
          begin
            for j:=1 to k-1 do
              now:=now*(n div i);
            now:=now*(n div i+1);
          end;
        if now>max then max:=now;
        inc(i);
      end;
    writeln(max);
    close(input);
    close(output);
  end.