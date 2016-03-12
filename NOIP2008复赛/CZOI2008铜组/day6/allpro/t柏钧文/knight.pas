var n,m,x,y,i,j:longint;
        a:array[1..1000,1..1000]of longint;

procedure print;
  var i,j,k:longint;
  begin
  write('(',1,',',1,')->');
  for i:=1 to n*m-1 do
        for j:=1 to n do
                for k:=1 to m do
                    if a[j,k]=i then write('(',j,',',k,')->');
  for i:=1 to n do
        for j:=1 to m do
                if a[i,j]=n*m then write('(',j,',',k,')');
  writeln;
  close(input);
  close(output);
  halt;
  end;

procedure try(dep,i,j:longint);
  var k:longint;
  begin
  if dep>n*m then print
            else for k:=1 to 8 do
                        begin
                        if k=1 then if ((i-2)>0)and((j-1)>0)and(a[i-2,j-1]=0)then begin a[i-2,j-1]:=dep;try(dep+1,i-2,j-1);end;
                        if k=2 then if ((i-2)>0)and((j+1)<m)and(a[i-2,j+1]=0)then begin a[i-2,j+1]:=dep;try(dep+1,i-2,j+1);end;
                        if k=3 then if ((i-1)>0)and((j+2)<m)and(a[i-1,j+2]=0)then begin a[i-1,j+2]:=dep;try(dep+1,i-1,j+2);end;
                        if k=4 then if ((i+1)<n)and((j+2)<m)and(a[i+1,j+2]=0)then begin a[i+1,j+2]:=dep;try(dep+1,i+1,j+2);end;
                        if k=5 then if ((i+2)<n)and((j+1)<m)and(a[i+2,j+1]=0)then begin a[i+2,j+1]:=dep;try(dep+1,i+2,j+1);end;
                        if k=6 then if ((i+2)<n)and((j-1)>0)and(a[i+2,j-1]=0)then begin a[i+2,j-1]:=dep;try(dep+1,i+2,j-1);end;
                        if k=7 then if ((i+1)<n)and((j-2)>0)and(a[i+1,j-2]=0)then begin a[i+1,j-2]:=dep;try(dep+1,i+1,j-2);end;
                        if k=8 then if ((i-1)>0)and((j-2)>0)and(a[i+1,j+2]=0)then begin a[i+1,j+2]:=dep;try(dep+1,i+1,j+2);end;
                        end;
  end;

begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
readln(n,m,x,y);
writeln('No Answer!');close(input);close(output);halt;
i:=x;
j:=y;
try(1,i,j);
writeln('No Answer!');
close(input);
close(output);
end.
