const maxn=5000;
var n,i,j,t,k,tmp,fmax:longint;
    a,pre:array[1..maxn]of longint;
    f:array[0..maxn]of longint;
    flag:boolean;
begin
assign(input,'rhyme.in');
reset(input);
assign(output,'rhyme.out');
rewrite(output);
readln(n);
for i:=1 to n do read(a[i]);
for i:=1 to n do
    begin
    for j:=i-1 downto 1 do
        if a[j]=a[i] then
           begin
           pre[i]:=j;
           break;
           end;
    end;
for i:=1 to n do
    begin
    f[i]:=f[i-1];
    if pre[i]<>0 then
       begin
       for j:=pre[i]-1 downto 1 do
           begin
           if (a[j]<>a[i])and(pre[j]>0) then
              begin
              if f[pre[j]-1]+1>f[i] then
                 begin
                 f[i]:=f[pre[j]-1]+1;
                 break;
                 end;
              end;
           end;
       t:=i;
       flag:=true;
       for j:=1 to 3 do
           begin
           if pre[t]=0 then begin flag:=false; break; end;
           t:=pre[t];
           end;
       if (flag)and(f[t-1]+1>f[i]) then f[i]:=f[t-1]+1;
       k:=pre[i];
       while k<>0 do
        begin
        tmp:=0;
        for j:=k+1 to i-1 do
            begin
            if (a[j]<>a[i])and(pre[j]<k) then
               if pre[j]>tmp then tmp:=pre[j];
            end;
        if (tmp<>0)and(f[tmp-1]+1>f[i]) then
           begin
           f[i]:=f[tmp-1]+1;
           break;
           end;
        k:=pre[k];
        end;
       k:=pre[i];
       while k<>0 do
         begin
         tmp:=0;
         for j:=k+1 to i-1 do
             begin
             if (a[j]<>a[i])and(pre[j]>k) then
                 begin
                 tmp:=j;
                 break;
                 end;
             end;
         if (tmp<>0)and(f[k-1]+1>f[i]) then
            begin
            f[i]:=f[k-1]+1;
            break;
            end;
         k:=pre[k];
         end;
       end;
    if f[i]>fmax then fmax:=f[i];
    end;
writeln(fmax);
close(input);
close(output);
end.