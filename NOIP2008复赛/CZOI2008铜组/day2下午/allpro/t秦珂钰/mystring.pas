program mystring(input,output);
var str:string;
    i,j,maxl,maxr,minl,minr,max,min,len,s,k:integer;
    maxs,mins:array[1..250] of char;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  readln(str);
  len:=length(str);
  i:=1;
  max:=1;
  maxl:=1;
  maxr:=1;
  minl:=1;
  for k:=2 to len do
    if str[k]=' ' then begin
                         min:=k-i;
                         minr:=k-1;
                         break;
                       end;
  for j:=2 to len do
    if str[j]=' ' then begin
                         s:=j-i;
                         if s>max then begin
                                          max:=s;
                                          maxl:=i;
                                          maxr:=j-1;
                                        end
                                   else if s<min then begin
                                                        min:=s;
                                                        minl:=i;
                                                        minr:=j-1;
                                                      end;
                         i:=j+1;
                       end;
  for i:=len downto 1 do
    if str[i]=' ' then begin
                         s:=len-i;
                         if s>max then begin
                                         max:=s;
                                         maxl:=i+1;
                                         maxr:=len;
                                         break;
                                       end;
                         if s<min then begin
                                         min:=s;
                                         minl:=i+1;
                                         minr:=len;
                                         break;
                                       end;
                      end;
  for i:=1 to max do
  begin
    maxs[i]:=str[maxl];
    maxl:=maxl+1;
  end;
  for i:=1 to min do
  begin
    mins[i]:=str[minl];
    minl:=minl+1;
  end;
  for i:=1 to max do
    write(maxs[i]);
  writeln;
  for i:=1 to min do
    write(mins[i]);
  close(input);
  close(output);
end.