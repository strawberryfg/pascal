Var i,j,k,n,min,m,sum,res:longint;
    t:array[1..18,1..18]of longint;
    b:array[1..18]of boolean;
Begin
  assign(input,'spring.in');reset(input);
  assign(output,'spring.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      read(t[i,j]);
  res:=maxlongint;
  for k:=1 to n do
    begin
      sum:=0;
      fillchar(b,sizeof(b),0);
      for i:=1 to n do
        if not b[i] then
	   begin
	     min:=maxlongint;
	     for j:=1 to n do
               if i<>j then
               if not b[j] then
                  if t[i,j]<min then
		     begin min:=t[i,j];m:=j;end;
	     sum:=sum+min;
	     b[i]:=true;b[m]:=true;
	   end;
      if sum<res then res:=sum;
    end;
  writeln(res);
  close(output);
End.
