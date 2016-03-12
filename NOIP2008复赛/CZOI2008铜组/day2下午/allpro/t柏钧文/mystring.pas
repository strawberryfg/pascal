var i,ti,dep,j,t,ts:longint;
        s,lt,ls:string;
        a:array[1..150]of string;
        b:array[1..150]of longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s);
ti:=1;
dep:=1;
for i:=1 to length(s) do
        a[i]:='';
i:=1;
s:=s+' ';
while i<=length(s) do
      if s[i]=' ' then begin
                       for j:=ti to i-1 do
                           a[dep]:=a[dep]+s[j];
                       ti:=i+1;
                       inc(dep);
                       inc(i);
                       end
                  else inc(i);
for i:=1 to dep-1 do
    b[i]:=length(a[i]);
ts:=b[1];
ls:=a[1];
for i:=2 to dep-1 do
    if b[i]>ts then begin
                    ts:=b[i];
                    ls:=a[i];
                    end;
writeln(ls);
ts:=b[1];
ls:=a[1];
for i:=2 to dep-1 do
    if b[i]<ts then begin
                    ts:=b[i];
                    ls:=a[i];
                    end;
writeln(ls);
close(input);
close(output);
end.
