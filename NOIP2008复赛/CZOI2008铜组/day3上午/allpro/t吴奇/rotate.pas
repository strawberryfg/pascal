program rotate;
var n,s,i,j:longint;
    a:array[1..20,1..20]of longint;
procedure try(x,y:longint);
begin
if x>2 then begin
     for i:=y to x+y-1 do
     begin
         a[y,i]:=s;
         inc(s);
     end;
     for i:=y+1 to x+y-1 do
     begin
         a[i,x+y-1]:=s;
         inc(s);
     end;
     for i:=y+x-2 downto y do
     begin
         a[x+y-1,i]:=s;
         inc(s);
     end;
     for i:=x+y-2 downto y+1 do
     begin
         a[i,y]:=s;
         inc(s);
     end;
     try(x-2,y+1);
     end
     else if x=1 then a[y,y]:=s
                 else if x=2 then begin
                                       a[y,y]:=s;
                                       inc(s);
                                       a[y,y+1]:=s;
                                       inc(s);
                                       a[y+1,y+1]:=s;
                                       inc(s);
                                       a[y+1,y]:=s;
                                  end;
end;
begin
assign(input,'rotate.in');reset(input);
assign(output,'rotate.out');rewrite(output);
read(n);
fillchar(a,sizeof(a),0);
s:=1;
try(n,1);
for i:=1 to n do
begin
  for j:=1 to n do
  write(a[i,j]:4);
  writeln;
  end;
close(input);
close(output);
end.
