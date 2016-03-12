var n,i,j,l,m:longint;
    k,t:string;
    s:array[1..200]of string;
    a:array[1..200]of longint;
begin
readln(n);
for i:=1 to n do
    begin
    readln(k);
    s[i]:=k;
    end;
for i:=1 to n do
    begin
    t:='';
    l:=1;
    while s[i][l]='0' do
          l:=l+1;
    for j:=l to length(s[i]) do
        t:=t+s[i][j];
    s[i]:=t;
    a[i]:=j-l+1;
    end;
for i:=1 to n-1 do
    for j:=i+1 to n do
        if a[i]<a[j] then begin l:=a[i];a[i]:=a[j];a[j]:=l;
                                t:=s[i];s[i]:=s[j];s[j]:=t;
                          end;
m:=a[1];
l:=1;
while a[l+1]=m do
      l:=l+1;
for i:=1 to l-1 do
    for j:=i+1 to l do
        if s[i]<s[j] then begin
                          t:=s[i];
                          s[i]:=s[j];
                          s[j]:=t;
                          end;
writeln('max:',s[1]);
end.