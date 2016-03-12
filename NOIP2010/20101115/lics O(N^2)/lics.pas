var lena,lenb,i,nummax,j,fmax:longint;
    a,b,f:array[0..6000]of longint;
begin
assign(input,'lics.in');
reset(input);
assign(output,'lics.out');
rewrite(output);
readln(lena,lenb);
for i:=1 to lena do read(a[i]);
for i:=1 to lenb do read(b[i]);
for i:=1 to lena do
    begin
    nummax:=0;
    for j:=1 to lenb do
        begin
        if b[j]<a[i] then
           begin
           if f[j]>f[nummax] then nummax:=j
           end
           else if b[j]=a[i] then
                   begin
                   if f[nummax]+1>f[j] then
                     f[j]:=f[nummax]+1
                   else nummax:=j;
                   end;
        end;
    end;
fmax:=0;
for i:=1 to lenb do if f[i]>fmax then fmax:=f[i];
writeln(fmax);
close(input);
close(output);
end.
