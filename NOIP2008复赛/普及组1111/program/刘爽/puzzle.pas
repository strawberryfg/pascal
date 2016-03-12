var hang,lie,puzzle:array[1..9,1..9]of longint;
    ge:array[1..3,1..3,1..9]of longint;
    open:array[1..100,1..2]of longint;
    pos:longint;
procedure file1;
begin
assign(input,'puzzle.in');
assign(output,'puzzle.out');
reset(input);
rewrite(output);
end;
procedure file2;
begin
close(input);
close(output);
end;
procedure dataout;
var oi,oj:longint;
begin
for oi:=1 to 9 do
 begin
   for oj:=1 to 9 do
     begin
     if oj=9 then writeln(puzzle[oi,oj])
             else write(puzzle[oi,oj],' ');
     end;
 end;
end;
procedure work(depth,a,b:longint);
var wi:longint;
begin
   if depth>pos then begin dataout;file2;halt;end
      else begin
              for wi:=1 to 9 do
                begin
                  if (hang[a,wi]=0)and(lie[b,wi]=0)
                   and(ge[(a-1)div 3+1,(b-1)div 3+1,wi]=0)
                    then begin
                         hang[a,wi]:=1;
                         lie[b,wi]:=1;
                         ge[(a-1)div 3+1,(b-1)div 3+1,wi]:=1;
                         puzzle[a,b]:=wi;
                         work(depth+1,open[depth+1,1],open[depth+1,2]);
                         hang[a,wi]:=0;
                         lie[b,wi]:=0;
                         ge[(a-1)div 3+1,(b-1)div 3+1,wi]:=0;
                         end;
                end;
           end;
end;
procedure datain;
var di,dj:longint;
begin
pos:=0;
fillchar(hang,sizeof(hang),0);
fillchar(lie,sizeof(lie),0);
fillchar(ge,sizeof(ge),0);
for di:=1 to 9 do
  for dj:=1 to 9 do
    begin
    read(puzzle[di,dj]);
    if puzzle[di,dj]=0 then
      begin
      inc(pos);
      open[pos,1]:=di;
      open[pos,2]:=dj;
      end
    else
    begin
    hang[di,puzzle[di,dj]]:=1;
    lie[dj,puzzle[di,dj]]:=1;
    ge[(di-1)div 3+1,(dj-1)div 3+1,puzzle[di,dj]]:=1;
    end;
    end;
end;
begin
file1;
datain;
work(1,open[1,1],open[1,2]);
file2;
end.
