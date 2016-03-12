program fire;
const
  maxn=6;
type
  Tmap=array[0..maxn+1,0..maxn+1]of longint;
var
  map:Tmap;
  n,now,max,i,j:longint;
  chr:char;
  procedure search(x,y:longint);
  var
      i,j:longint;
  begin
      if map[x,y]>0 then exit;
      i:=x;j:=y;
      while map[i,j]=0 do dec(i);
      if map[i,j]=2 then exit;
      i:=x;j:=y;
      while map[i,j]=0 do inc(i);
      if map[i,j]=2 then exit;
      i:=x;j:=y;
      while map[i,j]=0 do dec(j);
      if map[i,j]=2 then exit;
      i:=x;j:=y;
      while map[i,j]=0 do inc(j);
      if map[i,j]=2 then exit;
      map[x,y]:=2;
      inc(now);
      if now>max then max:=now;
      for i:=1 to n do
        for j:=1 to n do
          if (i>x) or ((i=x) and (j>y))
            then search(i,j);
      dec(now);
      map[x,y]:=0;
  end;
begin
    assign(input,'fire.in');
    reset(input);
    assign(output,'fire.out');
    rewrite(output);
    readln(n);
    max:=0;
    now:=0;
    for i:=0 to n+1 do
      for j:=0 to n+1 do
        map[i,j]:=1;
    for i:=1 to n do
    begin
      for j:=1 to n do
      begin
        read(chr);
        if chr='.'
          then map[i,j]:=0
          else map[i,j]:=1;
      end;
      readln;
    end;
    for i:=1 to n do
      for j:=1 to n do
        search(i,j);
    writeln(max);
    close(input);
    close(output);
end.
