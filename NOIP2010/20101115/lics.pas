var lena,lenb,i,j,knum,k,tf,fmax:longint;
    a,b:array[0..5000]of longint;
    t,f:array[0..3000,0..3000]of longint;
begin
assign(input,'lics.in');
reset(input);
assign(output,'lics.out');
rewrite(output);
readln(lena,lenb);
for i:=1 to lena do read(a[i]);
for i:=1 to lenb do read(b[i]);
for i:=1 to lena do
    begin     // to i to j 1..j
    for j:=1 to lenb do
        begin
        knum:=0;
        for k:=j downto 1 do if a[i]=b[k] then begin knum:=k; break; end;
        t[i,j]:=knum;
        end;              //t[i,j] the same as a[i] the latest j b[j]
    end;
for i:=1 to lena do
    begin
    for j:=1 to lenb do
       begin
        if a[i]=b[j] then
           begin
           for k:=i-1 downto 1 do
               begin
               if a[k]<a[i] then
                 begin
                 tf:=t[k,j-1];
                 f[i,j]:=f[k,tf]+1;
                 if f[i,j]>fmax then fmax:=f[i,j];
                 end;
               end;
           end;
       end;
    end;
writeln(fmax);
close(input);
close(output);
end.