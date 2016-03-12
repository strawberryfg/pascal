program PUZZLEczt;

var i,j,temp:longint;
    value:array[1..9,1..9]of longint;
    gh,gl,sqare:array[1..9,1..9]of boolean;




procedure print;
var i,j:longint;
    begin
      for i:=1 to 9 do
          begin
            for j:=1 to 8 do
                write(value[i,j],' ');
            writeln(value[i,9]);
          end;
      close(input);
      close(output);
      halt;
    end;


procedure search(xx,yy:longint);

var i,part:longint;
    begin
      if (xx>9) then print;
      if value[xx,yy]<>0
         then if yy=9 then search(xx+1,1)
                      else search(xx,yy+1)
         else for i:=1 to 9 do
                  if not(gh[xx,i]) and not(gl[yy,i]) then
                     begin
                       part:=(xx-1) div 3*3+(yy-1) div 3+1;
                       if not(sqare[part,i])
                          then begin
                                 value[xx,yy]:=i;
                                 gh[xx,i]:=true;
                                 gl[yy,i]:=true;
                                 sqare[part,i]:=true;
                                 if yy=9 then search(xx+1,1)
                                         else search(xx,yy+1);
                                 value[xx,yy]:=0;
                                 gh[xx,i]:=false;
                                 gl[yy,i]:=false;
                                 sqare[part,i]:=false;
                               end;
                      end;
end;



begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);

  for i:=1 to 9 do
      for j:=1 to 9 do
          begin
            read(value[i,j]);
            if value[i,j]<>0 then
               begin
                 gh[i,value[i,j]]:=true;
                 gl[j,value[i,j]]:=true;
                 sqare[(i-1) div 3*3+(j-1) div 3+1,value[i,j]]:=true;
               end;
          end;
 { for i:=1 to 9 do 
 begin
for j:=1 to 9 do 
    write(sqare[i,j]);
writeln;
end;}
search(1,1);

end.
