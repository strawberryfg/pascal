var n,i,sum,j,tt,tn,t:longint;
        a,b:array[1..100000]of longint;
begin
assign(input,'seq.in');
reset(input);
assign(output,'seq.out');
rewrite(output);
readln(n);
for i:=1 to n do
        begin
        readln(a[i]);
        b[i]:=a[i]*2;
        end;
fillchar(a,sizeof(a),0);
sum:=0;
a[1]:=b[1] div 2;
for i:=1 to n do
        begin
        a[i+1]:=b[i]-a[i];
        if a[i+1]<a[i] then
                begin
                if odd(b[i]) then a[i+1]:=b[i] div 2+1
                             else a[i+1]:=b[i] div 2;
                for j:=i downto 1 do
                        begin
                        a[j]:=b[j]-a[j+1];
                        if a[j+1]<a[j] then begin writeln('0');halt;end;
                        end;
                end;
        end;
inc(sum);
tt:=a[1];
tn:=n+1;
fillchar(a,sizeof(a),0);
if odd(tn) then t:=tn
        else t:=tn-1;
if odd(b[t-1]) then a[t]:=b[t-1] div 2+1
               else a[t]:=b[t-1] div 2;
if tn>t then a[tn]:=b[t]-a[t];
for i:=t downto 2 do
        begin
        a[i-1]:=b[i-1]-a[i];
        if a[i]<a[i-1] then
                        begin
                        if odd(b[i-1]) then a[i]:=b[i-1] div 2+1
                                        else a[i]:=b[i-1] div 2;
                        a[i-1]:=b[i-1]-a[i];
                        for j:=i to n do
                                begin
                                a[j+1]:=b[j]-a[j];
                                if a[j+1]<a[j] then begin writeln('0');halt;end;
                                end;
                        end;
        end;
writeln(tt-a[1]+1);
close(input);
close(output);
end.