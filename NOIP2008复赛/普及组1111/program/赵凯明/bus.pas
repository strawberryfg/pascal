var queue:array[1..2500] of char;
    n,d,i,j1,h1,th,tj,tt,f,h,j:longint;

begin
assign(input,'bus.in');reset(input);
assign(output,'bus.out');rewrite(output);
  readln(n,d);
  for i:=1 to n do
      begin
        read(queue[i]);
        if queue[i]='H' then inc(h)
                        else inc(j);
      end;
  f:=1;
  if ((h+d>=j)and (h<j)) or ((j<h)and(j+d>=h)) then writeln('1')
  else
  begin
  while f<>n do
        begin
          j1:=j;h1:=h;
          i:=n;
          if (h=0) or (j=0) then begin inc(tt);break;end;
          while (h<>j+d) and (j<>h+d) do
                begin
                  if queue[i]='H' then dec(h)
                                  else dec(j);
                  dec(i);
                  if i<f then break;
                end;
          inc(tt);
          f:=i;
          j:=j1-j;h:=h1-h;
        end;
  writeln(tt);
  end;
  {while i<=n do
      begin
        inc(i);
        if queue[i]='H' then inc(th)
                        else inc(tj);
       if th=tj+d then
          begin
            a[i+1]='H'
          end;
      end;
  if (th>0) or (tj>0) then
  writeln(tt+1) else writeln(tt);}
close(input);close(output);
end.
