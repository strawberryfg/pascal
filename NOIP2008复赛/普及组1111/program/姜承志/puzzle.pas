var puzzle:array[1..9,1..9]of integer;
    need,i1,i2:byte;
function pd(num,x,y:byte):boolean;
         var i,j,px,py:byte;
         begin
         pd:=true;
         for i:=1 to 9 do
             if (puzzle[x,i]=num)or(puzzle[i,y]=num) then begin
                                                  pd:=false;
                                                  exit;
                                                  end;
         case x of
              1..3:px:=1;
              4..6:px:=4;
              7..9:px:=7;
              end;
         case y of
              1..3:py:=1;
              4..6:py:=4;
              7..9:py:=7;
              end;
         for i:=px to px+2 do
             for j:=py to py+2 do
                 if puzzle[i,j]=num then begin
                                     pd:=false;
                                     exit;
                                     end;
         end;
procedure try(dep,x,y:byte);
          var i1,i2,i:byte;
          begin
          if dep>need then begin
                           rewrite(output);
                           for i1:=1 to 9 do
                               begin
                               for i2:=1 to 8 do
                                   write(puzzle[i1,i2],' ');
                               writeln(puzzle[i1,9]);
                               end;
                           close(output);
                           end
                      else for i:=1 to 9 do
                               if pd(i,x,y) then begin
                                                  puzzle[x,y]:=i;
                                                  for i1:=1 to 9 do
                                                      begin
                                                      for i2:=1 to 9 do
                                                          if puzzle[i1,i2]=0 then break;
                                                      if puzzle[i1,i2]=0 then break;
                                                      end;
                                                  try(dep+1,i1,i2);
                                                  puzzle[x,y]:=0;
                                                  end;
          end;
begin
assign(input,'puzzle.in');
assign(output,'puzzle.out');
reset(input);
need:=81;
for i1:=1 to 9 do
    for i2:=1 to 9 do
        begin
        read(puzzle[i1,i2]);
        if puzzle[i1,i2]<>0 then dec(need);
        end;
close(input);
try(1,1,1);
end.
