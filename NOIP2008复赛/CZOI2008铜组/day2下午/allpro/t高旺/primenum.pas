var a:array[1..1000] of integer;
    i,j,s:integer;
    
function pd(x:integer):boolean;
var k:integer;
begin
  pd:=true;
  if x=1 then begin
                 pd:=false;
                 exit; 
               end;
  for k:=2 to x-1 do
    if x mod k=0 then begin
                         pd:=false;
                         break;
                       end;
end;

begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  i:=0;
  while not eof do
    begin
      i:=i+1;
      readln(a[i]);
    end;
  s:=0;   
  for j:=1 to i do
    if pd(a[j]) then s:=s+1;            
  writeln(s);
  close(input);
  close(output);
end.
