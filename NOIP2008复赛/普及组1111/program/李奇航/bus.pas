var sum,n,d,l,i,h,j,max:longint;
    s:array[1..25000]of char;
    c:array[1..25000] of longint;
    b:boolean;
procedure check;
begin
if (h=0) or (j=0) then begin writeln(sum) ; close(input); close(output); halt; end;
for i:=1 to l do
    if c[i]<=d then begin max:=i; b:=true; end;
//if b=false then begin writeln(sum); close(input); close(output); halt; end;
end;
procedure guanggun;
begin
h:=0;
j:=0;
for i:=1 to l do
    begin
    if s[i]='H' then inc(h);
    if s[i]='J' then inc(j);
    c[i]:=abs(h-j);
    end;
end;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
reset(input);
b:=false;
readln(n,d);
for i:=1 to n do
    read(s[i]);
readln;
sum:=0;
l:=n;
while l<>0 do
      begin
      fillchar(c,sizeof(c),0);
      inc(sum);
      guanggun;
      check;
      l:=l-max;
      for i:=1 to l do
          s[i]:=s[i+max];
      for i:=l+1 to n do
          s[i]:=' ';
      end;
writeln(sum);
close(input);
close(output);
end.
