var z:array[1..201]of integer;
    y:array[1..10000]of integer;
    x:array[1..10000]of integer;
    a,b,n,t,max,i,cishu:longint;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output); 
  readln(n,a,b);
  for i:=1 to n do read(z[i]);
  cishu:=0;
  t:=a;
  max:=1000000;
  while t>0 do
  begin
  if t=b then begin
                if max>cishu then begin
                                    max:=cishu;
                                    break;
                                  end
                             else break
              end
              else
   cishu:=cishu+1;
  if (t+z[t])<=n then begin
                          t:=t+z[t];
                          y[cishu]:=1;
                        end
                 else begin
                      t:=t-z[t];
                      y[cishu]:=0;
                      end;
  x[cishu]:=t;
  if t<=0 then begin
                 for i:=cishu downto 1 do
                 if (y[i]=1)and((x[i]+z[x[i]])<=n) then begin
                                                          t:=x[i];
                                                          cishu:=i;
                                                          break;
                                                        end
                                                   else
               end;
  end;
  if t<=0 then writeln('-1')
          else begin
                 for i:=cishu downto 1 do
                 if (y[i]=1)and((x[i]+z[x[i]])<=n) then begin
                                                          t:=x[i];
                                                          cishu:=i;
while t>0 do
  begin
  if t=b then begin
                if max>cishu then begin
                                    max:=cishu;
                                    break;
                                  end
                             else break
              end
              else
   cishu:=cishu+1;
  if (t-z[t])<n then begin
                          t:=t-z[t];
                          y[cishu]:=0;
                        end
                 else begin
                      t:=t+z[t];
                      y[cishu]:=1;
                      end;
  x[cishu]:=t;
  if t<=0 then begin
                 for i:=cishu downto 1 do
                 if (y[i]=1)and((x[i]+z[x[i]])<=n) then begin
                                                          t:=x[i];
                                                          cishu:=i;
                                                          break;
                                                        end
                                                   else
               end;
  end;
  end;
  writeln(max);

               end;
  close(input);
  close(output);
end.
