
var a:array[1..250] of string;
    len:array[1..250] of integer;
    temp:char;
    i,j,max,min,tmax,tmin:integer;
    s:string;
begin
  assign(input,'mystring.in');reset(input);
  assign(output,'mystring.out');rewrite(output);
  for i:=1 to 250 do a[i]:='';
  fillchar(len,sizeof(len),0);
  i:=1;
  readln(s);
  for j:=1 to length(s) do
    if s[j]=' 'then inc(i)
               else begin a[i]:=a[i]+s[j];len[i]:=len[i]+1;end;
  max:=0;
  min:=255;
  for j:=1 to i do
  begin
    if len[j]>max then begin tmax:=j;max:=len[j] end;
    if len[j]<min then begin tmin:=j;min:=len[j] end;
  end;
  writeln(a[tmax]);
  writeln(a[tmin]);
  close(input);
  close(output);
end.
