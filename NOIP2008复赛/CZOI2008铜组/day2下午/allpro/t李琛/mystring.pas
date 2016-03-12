var str:string;
    a:array[1..250] of string;
    b:array[0..250] of integer;
    c:array[1..250] of integer;
    max,min,maxn,minn,i,j:integer;


    begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output); 
  readln(str);
  j:=1;
  b[0]:=0;
  for i:=1 to length(str) do
  if (str[i]=' ') and(i< length(str)) then begin
                      b[j]:=i;
                      j:= j+1;
                     end;
  b[j]:=length(str);
  for i:=1 to j do
   c[i]:=b[i]-b[i-1];
  max:=c[1];
  for i:= 2 to j do
  if c[i]>max then begin
                     max:=c[i];
                     maxn:=b[i-1];
                    end;
  min:= c[1];
  for i:= 2to j-1 do
  if (c[i]<min) and (c[i]<>0) then begin
                   min:=c[i];
                   minn:=b[i-1];
                   end;
  for i:=maxn+1 to maxn+max do
  write(str[i]);
  writeln;
  for i:= minn+1 to minn+min do
  write(str[i]);
  writeln;
close(input);
close(output);
end.