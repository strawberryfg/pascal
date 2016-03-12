var i,j,n,t,k:longint;
    a:array[1..100,1..100]of longint;
    s:string;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
 begin
   j:=0;
   readln(s);
   for k:=1 to n do
     if s[k]='X' then begin inc(j);a[i,j]:=-1;end
              else begin inc(j);a[i,j]:=1;end;
 end;
for i:=1 to n do
 for j:=1 to n do
   begin
     if a[i,j]=1 then begin
                        inc(t);
                        k:=i;
                        while (a[k,j]<>-1) and (k<=n)do
                         begin
                          a[k,j]:=-1;
                          inc(k);
                         end;
                        k:=j+1;
                        while (a[i,k]<>-1)and (k<=n) do
                          begin
                           a[i,k]:=-1;
                           inc(k);
                          end;
                      end;
   end;
writeln(t);
close(input);
close(output);
end.
