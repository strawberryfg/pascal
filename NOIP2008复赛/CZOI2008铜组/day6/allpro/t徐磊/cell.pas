var a:array[0..61,0..61]of boolean;
    ch:char;
    way:array[1..4,1..2]of integer;
    n,m,i,j,total,sum:longint;

procedure sou(x,y:longint);
var i:longint;
begin
  for i:=1 to 4 do
    if a[x+way[i,1],y+way[i,2]] then begin
      a[x+way[i,1],y+way[i,2]]:=false;
      inc(sum);
      sou(x+way[i,1],y+way[i,2]);
    end;
end;

begin
  assign(input,'cell.in');reset(input);
  assign(output,'cell.out');rewrite(output);
  fillchar(a,sizeof(a),false);
  way[1,1]:=-1;way[1,2]:=0;
  way[2,1]:=0;way[2,2]:=1;
  way[3,1]:=1;way[3,2]:=0;
  way[4,1]:=0;way[4,2]:=-1;
  total:=0;
  readln(m,n);
  for i:=1 to m do
  begin
    for j:=1 to n do
    begin
      read(ch);
      if ch='0'then a[i,j]:=false
               else a[i,j]:=true;
    end;
    readln;
  end;
  for i:=1 to m do
    for j:=1 to n do
    begin
      if a[i,j] then begin
        sum:=0;
        a[i,j]:=false;
        sou(i,j);
        if sum>0 then inc(total);
      end;
    end;
  writeln(total);
  close(input);
  close(output);
end.
