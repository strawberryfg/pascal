program krunch(input,output);
var a:array[1..70] of char;
    str,str1:string;
    i,j,k:longint;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  for i:=1 to 70 do
    a[i]:='a';
  read(str);
  for i:=1 to length(str) do
    a[i]:=str[i];
  for i:=1 to 70 do
    if (a[i]='A') or (a[i]='E') or (a[i]='I') or (a[i]='O') or (a[i]='U') then a[i]:='a';
  for i:=1 to 70 do
    for j:=i+1 to 70 do
      if (a[j]=a[i]) and (a[j]<>' ') then a[j]:='a';
  j:=0;
  for i:=1 to 70 do
    if a[i]<>'a' then begin
                        j:=j+1;
                        str1[j]:=a[i];
                      end;
  for i:=1 to j do
    if (str1[i]=' ') and (str1[i+1]=' ') then str1[i]:='a';
  k:=0;
  for i:=1 to j do
    if str1[i]<>'a' then begin
                           k:=k+1;
                           a[k]:=str1[i];
                         end;
  if a[1]=' ' then begin
                     for i:=1 to k-1 do
                       a[i]:=a[i+1];
                     k:=k-1;
                   end;
  if a[k]=' ' then k:=k-1;
  for i:=1 to k do
    write(a[i]);
  close(input);
  close(output);
end.
