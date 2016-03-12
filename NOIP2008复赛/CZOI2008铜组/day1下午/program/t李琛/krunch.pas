var n:string;
     k,i,j:integer;
begin
   assign(input,'krunch.in');
     reset(input);
     assign(output,'krunch.out');
     rewrite(output);
   readln(n);
   for i:= 1to length(n) do
    begin
      for j:= i+1 to length(n) do
        if (n[i]= n[j])and(n[i]<>' ') then  for k:=j to length(n) do
                                    n[k]:=n[k+1];
    end;
    for i:=1 to length(n) do
     begin
     if (n[i]='a')  then
     for k:= i to length (n)do
      n[k]:=n[k+1];
      if (n[i]='e')  then
     for k:= i to length (n)do
      n[k]:=n[k+1];
      if (n[i]='i')  then
     for k:= i to length (n)do
      n[k]:=n[k+1];
      if (n[i]='o')  then
     for k:= i to length (n)do
      n[k]:=n[k+1];
      if (n[i]='u')  then
     for k:= i to length (n)do
      n[k]:=n[k+1];
    for i:= 1 to length(n) do
    if n[i]=n[i+1] then
     for k:= i+1 to length (n)do
      n[k]:=n[k+1];
    end;

  writeln(n);
   close(input);
     close(output);
end.
