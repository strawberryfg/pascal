Program p8_1(Input, Output);
const maxline=100;
var i,j,t,line:integer;
    a,max:array [1..maxline,1..maxline] of integer;
function maxsum(i,j:integer):integer;
begin
     if i=line
        then maxsum:=a[i,j]
        else if maxsum(i+1,j)>maxsum(i+1,j+1)
                then maxsum:=maxsum(i+1,j)+a[i,j]
                else maxsum:=maxsum(i+1,j+1)+a[i,j]
end;
begin
     write('Input number of line(<=100):'); readln(line);
     for i:=1 to line do
     begin
          for j:=1 to i do
          begin
               a[i,j]:=random(99)+1;
               write(a[i,j]:3)
          end;
          writeln
     end;
     writeln;
     writeln('Maxsum=',maxsum(1,1));
     max[1,1]:=a[1,1];
     for i:=2 to line do
     begin
          max[i,1]:=max[i-1,1]+a[i-1,1];
          for j:=2 to i-1 do
               if a[i,j]+max[i-1,j]>=a[i,j]+max[i-1,j-1]
                  then max[i,j]:=a[i,j]+max[i-1,j]
                  else max[i,j]:=a[i,j]+max[i-1,j-1];
          max[i,i]:=max[i-1,i-1]+a[i,i]
     end;
     t:=0;
     for i:=1 to line do
         if t<max[line,i] then t:=max[line,i];
     writeln('The maximum sum is:',t)
end.
