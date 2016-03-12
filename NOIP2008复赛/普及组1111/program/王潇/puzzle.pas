Var i,j,num:longint;
    a:array[1..9,1..9]of longint;
    b:array[1..3,1..3,1..9]of boolean;
    c,d:array[1..9,1..9]of boolean;
    list:array[1..81,1..3]of longint;
Procedure print;
var i,j:longint;
begin
  for i:=1 to num do
    a[list[i,1],list[i,2]]:=list[i,3];
  for i:=1 to 9 do
    begin
      write(a[i,1]);
      for j:=2 to 9 do
        write(' ',a[i,j]);
      writeln
    end;
end;
Procedure try(m,n:longint);
var i:longint;
begin
  if m>num then print
           else begin
		  list[m,3]:=n;
                  for i:=1 to 9 do
                    if (not b[(list[1,1]-1)div 3+1,(list[1,2]-1)div 3+1,i])and(not c[(list[1,1]-1)div 3+1,i])and(not d[(list[1,2]-1)div 3+1,i]) then
                       try(m+1,i);
		end;
end;
Begin
  for i:=1 to 9 do
    for j:=1 to 9 do
      begin
        read(a[i,j]);
        if a[i,j]=0 then
           begin
	     inc(num);
	     list[num,1]:=i;
      	     list[num,2]:=j;
  	   end else
           begin
             b[(i-1) div 3+1,(j-1) div 3+1,a[i,j]]:=true;
             c[i,a[i,j]]:=true;
             d[j,a[i,j]]:=true;
           end;
      end;
  close(input);
  for i:=1 to 9 do
    if (not b[(list[1,1]-1)div 3+1,(list[1,2]-1)div 3+1,i])and(not c[(list[1,1]-1)div 3+1,i])and(not d[(list[1,2]-1)div 3+1,i]) then
       try(1,i);
End.
