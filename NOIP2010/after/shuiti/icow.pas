var n,t,i,j,max,num,minnum,sum,tmp:longint;
    f,pos,r:array[1..10000]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=f[(l+r) div 2];
         repeat
           while f[i]>x do
            inc(i);
           while x>f[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=f[i];
                f[i]:=f[j];
                f[j]:=y;
                y:=pos[i];
                pos[i]:=pos[j];
                pos[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
readln(n,t);
for i:=1 to n do
    begin
    readln(r[i]);
    end;
for i:=1 to t do
    begin
    max:=0; num:=0; minnum:=maxlongint;
    for j:=1 to n do
        begin
        if r[j]>max then
           begin
           max:=r[j];
           num:=j;
           end;
        end;
    writeln(num);
    if r[num] mod (n-1)=0 then
       begin
       for j:=1 to n do
           begin
           if j<>num then r[j]:=r[j]+r[num] div (n-1);
           end;
       r[num]:=0;
       end
    else begin
         fillchar(f,sizeof(f),0);
         fillchar(pos,sizeof(pos),0);
         sum:=0;
         for j:=1 to n do if j<>num then begin inc(sum);pos[sum]:=j; f[sum]:=r[j]; end;
         sort(1,n-1);
         for j:=1 to n-1 do
             begin
             tmp:=pos[j];
             inc(r[tmp],r[num] div (n-1));
             if j<=r[num] mod (n-1) then inc(r[tmp]);
             end;
         r[num]:=0;
         end;
    end;
end.