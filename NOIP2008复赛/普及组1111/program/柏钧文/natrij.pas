var s,ss:string;
        i1,i,j,dep:longint;
        d:array[1..3] of string;
        a,b,c:array[1..3]of longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(s);
s:=s+':';
i1:=1;
dep:=0;
for i:=1 to length(s) do
        if s[i]=':' then begin
                         ss:='';
                         for j:=i1 to i-1 do
                                ss:=ss+s[j];
                         if ss[1]='0' then ss:=ss[2];
                         inc(dep);
                         val(ss,a[dep]);
                         i1:=i+1;
                         end;
readln(s);
s:=s+':';
i1:=1;
dep:=0;
for i:=1 to length(s) do
        if s[i]=':' then begin
                         ss:='';
                         for j:=i1 to i-1 do
                                ss:=ss+s[j];
                         if ss[1]='0' then ss:=ss[2];
                         inc(dep);
                         val(ss,b[dep]);
                         i1:=i+1;
                         end;
for i:=dep downto 2 do
        begin
        if b[i]>=a[i] then begin c[i]:=b[i]-a[i];
                                        str(c[i],d[i]);
                                        if length(d[i])=1 then d[i]:='0'+d[i];
                               end
                          else
                                begin
                                c[i]:=b[i]+60-a[i];
                                dec(b[i-1]);
                                str(c[i],d[i]);
                                        if length(d[i])=1 then d[i]:='0'+d[i];
                                end;
        end;
if b[1]>=a[1] then begin c[1]:=b[1]-a[1];
                                        str(c[1],d[1]);
                                        if length(d[1])=1 then d[1]:='0'+d[1];
                               end
                          else
                                begin
                                c[1]:=b[1]+24-a[1];
                                str(c[1],d[1]);
                                        if length(d[1])=1 then d[1]:='0'+d[1];
                                end;
writeln(d[1],':',d[2],':',d[3]);
close(input);
close(output);
end.