const horse:packed array[1..8,1..2]of shortint=((-2,1),(2,1),(1,2),(2,-1),(1,-2),(-1,-2),(-1,2),(-2,-1));
var cx,cy,x,y,need:shortint;
    gogo:array[1..10,1..10]of byte;
procedure print;
          var i1,i2,i3:byte;
          begin
          rewrite(output);
          for i1:=1 to need-1 do
              for i2:=1 to cx do
                  for i3:=1 to cy do
                       if gogo[i2,i3]=i1 then write('(',i2,',',i3,')','->');
          for i1:=1 to cx do
              for i2:=1 to cy do
                  if gogo[i1,i2]=need then begin
                                           writeln('(',i1,',',i2,')');
                                           close(output);
                                           halt;
                                           end;
          end;
procedure try(dep:byte);
          var i:byte;
          begin
          if dep>need then print
                      else for i:=1 to 8 do
                           begin
                           x:=x+horse[i,1];
                           y:=y+horse[i,2];
                           if (x<=0)or(y<=0)or(x>cx)or(y>cy)or(gogo[x,y]<>0) then begin
                                                                             x:=x-horse[i,1];
                                                                             y:=y-horse[i,2];
                                                                             continue;
                                                                             end;
                           if gogo[x,y]=0 then begin
                                               gogo[x,y]:=dep;
                                               try(dep+1);
                                               end;
                           gogo[x,y]:=0;
                           x:=x-horse[i,1];
                           y:=y-horse[i,2];
                           end;
          end;
begin
assign(input,'knight.in');
assign(output,'knight.out');
reset(input);
read(cx,cy,x,y);
need:=cx*cy;
close(input);
gogo[x,y]:=1;
try(2);
rewrite(output);
writeln('No Answer!');
close(output);
end.