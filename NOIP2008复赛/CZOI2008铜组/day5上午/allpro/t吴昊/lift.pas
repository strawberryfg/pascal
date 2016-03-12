var n,i,t,a,b,x,s,q:longint;
    k:array[1..200] of longint;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  randomize;
  readln(n,a,b);
  for i:=1 to n do
    read(k[i]);
  if ((a<b) and (a+k[a]=b)) or ((a>b) and (a-k[a]=b)) then begin writeln(1);halt;close(input);close(output) end;
  t:=a;
  s:=0;
  for i:=1 to 500000 do
    begin
      q:=random(101);
      if t=b then begin writeln(s);close(input);close(output);halt end;
      if (t+k[t]>n) and (t-k[t]<1) then begin writeln(-1);close(input);close(output);halt end else
         if t+k[t]>n then begin t:=t-k[t];s:=s+1;end else
            if t-k[t]<1 then begin t:=t+k[t];s:=s+1; end else
               if q>49 then begin t:=t+k[t];s:=s+1 end else begin t:=t-k[t];s:=s+1 end;
    end;
  writeln(-1);
  close(input);
  close(output);
end.
