var i,n,j,t,p:longint;
    h,f,max:array[1..100000]of longint;
    mark:boolean;
    ans:int64;
begin
assign(input,'badhair.in');
reset(input);
assign(output,'badhair.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(h[i]);
    end;
ans:=0;
if h[n-1]<h[n] then max[n-1]:=n else begin f[n-1]:=1;inc(ans); end;
for i:=n-2 downto 1 do
    begin
    t:=max[i+1];
    if h[i]<=h[i+1] then begin f[i]:=0; max[i]:=i+1;continue; end;
    if t=0 then
       begin
       if h[i+1]<h[i] then f[i]:=f[i+1]+1;
       end
    else
    begin
     p:=i;
     mark:=true;
     repeat
     begin
      if h[t]<h[i] then inc(f[i]) else mark:=false;

      inc(f[i],t-p-1);
      p:=t;
      t:=max[t];
     end;
     until (t=0)or(mark=false);
     if (mark=true)and(t=0) then inc(f[i],n-p);
    end;
    ans:=int64(ans)+int64(f[i]);
    if max[i+1]=0 then begin if h[i+1]>h[i] then max[i]:=i+1 else max[i]:=0; end
       else begin
            t:=max[i+1];
            while (t<>0)and(h[i]>=h[t]) do t:=max[t];
            if t<>0 then max[i]:=t else max[i]:=0;
            end;
    end;
writeln(ans);
close(input);
close(output);
end.
