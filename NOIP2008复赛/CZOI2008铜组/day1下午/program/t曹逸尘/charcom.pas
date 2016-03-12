program charcom;
var N,i,j:longint;
    a:array[1..1000] of string;
    s:string;
begin
  assign(input,'charcom.in');
  reset(input);
  assign(output,'charcom.out');
  rewrite(output);
  readln(N);
  readln(s);
  a[1]:='A';
  if s='A' then write(1)
           else if length(s)=N then write(N)
                               else if s='AB' then write(2)
                                              else
  for i:= 1 to N*(N-1) do
   a[i]:=' ';
  for i:= 2 to N*(N-1) do
    for j:= i to N do
    begin
    if (a[j]=' ') or (a[i]=' ') then
     begin
     a[j]:=concat(a[j-1],chr(64+j));
      end;
    end;
  for i:= 1 to N*(N-1)+1 do
    if a[i]=s then write(i);
  close(input);
  close(output);
end.
