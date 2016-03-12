var a,s,t:array[1..100] of longint;
    n,i,j,x:longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
j:=0;
for i:=1 to n do
    begin
    read(a[i]);
    s[i]:=i;
    end;
for i:=1 to n-1 do
    begin
    for j:=i+1 to n do
        if a[i]<a[j] then begin
                          x:=a[i];
                          a[i]:=a[j];
                          a[j]:=x;
                          x:=s[i];
                          s[i]:=s[j];
                          s[j]:=x;
                          end;
    end;
i:=0;
repeat
begin
i:=i+1;
for j:=1 to n do
    if (a[i]<a[j])and(s[i]>s[j]) then t[i]:=t[i]+1
                                 else if (a[i]>a[j])and(s[i]<s[j]) then t[i]:=t[i]+1;
end;
until i=n;
for i:=1 to n do
    t[i]:=n-t[i];
for i:=1 to n-1 do
    begin
    for j:=i+1 to n do
        if t[i]<t[j] then begin
                          x:=t[i];
                          t[i]:=t[j];
                          t[j]:=x;
                          end;
    end;
writeln(t[n-1]);
close(input);
close(output);
end.
