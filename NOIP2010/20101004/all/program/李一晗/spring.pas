var n,i,j,min,s:longint;
    time,pd:array[1..18,1..18]of longint;

procedure try(x:longint);
var i,j,k:longint;
begin
  for i:=1 to n do
    for j:=1 to n do
      if (pd[i,j]=0)and(i<>j)and(pd[j,i]=0) then
        begin
          for k:=1 to n do
            begin
              pd[i,k]:=1;
              //pd[k,i]:=1;
              pd[j,k]:=1;
              //pd[k,j]:=1;
            end;
          s:=s+time[i,j];
          if x<n div 2 then try(x+1)
                       else if min>s then min:=s;
          s:=s-time[i,j];
          for k:=1 to n do
            begin
              pd[i,k]:=0;
              //pd[k,i]:=0;
              pd[j,k]:=0;
              //pd[k,j]:=0;
            end;
        end;
end;

begin
assign(input,'spring.in');
assign(output,'spring.out');
reset(input);
rewrite(output);
  readln(n);
  min:=maxlongint;
  for i:=1 to n do
    for j:=1 to n do
      read(time[i,j]);
  readln;
  try(1);
  writeln(min);
close(input);
close(output);
end.