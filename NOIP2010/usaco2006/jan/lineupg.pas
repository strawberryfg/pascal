var n,q,i,j,t,p,a,b,max,min,down:longint;
    h,fmin,fmax:array[1..100000]of longint;
begin
assign(input,'lineupg.in');
reset(input);
assign(output,'lineupg.out');
rewrite(output);
readln(n,q);
t:=trunc(sqrt(n));
for i:=1 to t+1 do begin fmin[i]:=maxlongint; fmax[i]:=-2147483647; end;
for i:=1 to n do
    begin
    readln(h[i]);
    if i mod t=0 then p:=i div t
       else p:=i div t+1;
    if h[i]<fmin[p] then fmin[p]:=h[i];
    if h[i]>fmax[p] then fmax[p]:=h[i];
    end;
for i:=1 to q do
    begin
    readln(a,b);
    if a mod t=0 then p:=a div t
       else p:=a div t+1;
    if b mod t=0 then q:=b div t
       else q:=b div t+1;
    if p=q then
       begin
       max:=0;min:=maxlongint;
       for j:=a to b do
          begin
          if h[j]<min then min:=h[j];
          if h[j]>max then max:=h[j];
          end;
       writeln(max-min);
       end
    else begin
         down:=p;  max:=0; min:=maxlongint;
         if down>=0 then
            begin
            for j:=a to  down*t do
                begin
                if h[j]<min then min:=h[j];
                if h[j]>max then max:=h[j];
                end;
            end;
         for j:=p+1 to q-1 do
             begin
             if fmax[j]>max then max:=fmax[j];
             if fmin[j]<min then min:=fmin[j];
             end;
         for j:=(q-1)*t+1 to b do
             begin
             if h[j]>max then max:=h[j];
             if h[j]<min then min:=h[j];
             end;
         writeln(max-min);
         end;
    end;
close(input);
close(output);
end.