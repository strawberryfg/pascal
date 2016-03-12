var  a:array[1..10,1..10]of char;
        i,j,sum,nn:longint;

function pd(n,m:longint):boolean;
  var i,i1,j1,j:longint;
  begin
  pd:=true;
  i1:=1;j1:=nn;
  for i:=1 to m do
      if a[n,i]='X' then i1:=i;
  for i:=m to nn do
        if a[n,i]='X' then begin j1:=i;break;end;
  for i:=i1 to j1 do
        if a[n,i]='1' then begin pd:=false;exit; end;
  i1:=1;j1:=nn;
  for i:=1 to n do
      if a[i,m]='X' then i1:=i;
  for i:=n to nn do
        if a[i,m]='X' then begin j1:=i;break;end;
  for i:=i1 to j1 do
        if a[i,m]='1' then begin pd:=false;exit; end;
  end;

begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(nn);
for i:=1 to nn do
        begin
        for j:=1 to nn do
            read(a[i,j]);
        readln;
        end;
sum:=0;
for i:=1 to nn do
        for j:=1 to nn do
                if a[i,j]='.' then if pd(i,j) then
                   begin a[i,j]:='1';inc(sum);end;
writeln(sum);
for i:=1 to nn do
        begin
        for j:=1 to nn do
                write(a[i,j]);
        writeln;
        end;
close(input);
close(output);
end.
