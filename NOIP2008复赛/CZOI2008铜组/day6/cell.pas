const di:array[1..4]of integer=(0,0,1,-1);
      dj:array[1..4]of integer=(1,-1,0,0);
var i,j,k,m,n,sum,old,new,ti,tj:longint;
    s:array[1..60]of string[60];
    x,y:array[1..1000]of integer;
    f:array[1..1000,1..1000]of integer;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(m,n);
for i:=1 to m do
    readln(s[i]);
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        if s[i,j]<>'0' then
           begin
           fillchar(x,sizeof(x),0);
           fillchar(y,sizeof(y),0);
           old:=1;
           new:=1;
           x[old]:=i;
           y[old]:=j;
           inc(sum);
           while old<=new do
                 begin
                 for k:=1 to 4 do
                     begin
                     ti:=x[old]+di[k];
                     tj:=y[old]+dj[k];
                     if (ti>0)and(ti<=m)and(tj>0)and(tj<=n)and(s[ti,tj]<>'0') then
                        begin
                        inc(new);
                        x[new]:=ti;
                        y[new]:=tj;
                        s[ti,tj]:='0';
                        end;
                     end;
                 inc(old);
                 end;
           end;
        end;
    end;
writeln(sum);
close(input);
close(output);
end.