var a:array[0..200]of string;
    i,n:longint;

function jia(a,b:string):string;
var s:string;
    str:array[1..100000]of char;
    ti,i,tj,dep,li,c,t:longint;
  begin
  if length(a)>length(b) then li:=length(b)
                         else li:=length(a);
  dep:=0;
  ti:=length(a);
  tj:=length(b);
  t:=0;
  while dep<li do
        begin
        c:=ord(a[ti])-48+ord(b[tj])-48+t;
        if c>=10 then begin c:=c mod 10;t:=1; end
                 else t:=0;
        inc(dep);
        str[dep]:=chr(c+48);
        dec(ti);
        dec(tj);
        end;
  if (t=1)and(length(a)=length(b)) then begin inc(dep);str[dep]:='1';end;
  if length(a)>length(b) then
  begin
  ti:=length(a)-length(b);
  while dep<length(a) do
        begin
        c:=ord(a[ti])-48+t;
        if c>=10 then begin c:=c mod 10;t:=1; end
                 else t:=0;
        inc(dep);
        str[dep]:=chr(c+48);
        dec(ti);
        dec(tj);
        end;
  end;
  if length(a)<length(b) then
  begin
  ti:=length(b)-length(a);
  while dep<length(b) do
        begin
        c:=ord(b[ti])-48+t;
        if c>=10 then begin c:=c mod 10;t:=1; end
                 else t:=0;
        inc(dep);
        str[dep]:=chr(c+48);
        dec(ti);
        dec(tj);
        end;
  end;
  if (t=1)and((length(a)>length(b))or(length(a)>length(b)))  then begin inc(dep);str[dep]:='1';end;
  s:='';
  for i:=dep downto 1 do
       s:=s+str[i];
  jia:=s;
  end;

begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
a[0]:='1';
a[1]:='1';
a[2]:='1';
for i:=3 to n-1 do
    a[i]:=jia(a[i-1],a[i-2]);
writeln(a[n-1]);
close(input);
close(output);
end.
