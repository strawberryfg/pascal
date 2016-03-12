program ex4;
type tlist=array[1..3]of longint;
var str:string;
    a:array[1..1000] of tlist;
    i,j,ll,ln,s,k,max,lea:longint;
    ch:char;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  readln(str);
  str:=str+' ';
  s:=1;
  k:=1;
  for i:=1 to length(str)+1 do
   if str[i]=' ' then begin a[k][2]:=i;a[k][1]:=i-s;a[k][3]:=s;s:=i+1;inc(k);end;
   max:=a[1][1];
   lea:=a[1][1];
   ll:=1;
   ln:=1;
  for i:=1 to k-1 do if a[i][1]>max then begin max:=a[i][1];ln:=i;end;
  for i:=1 to k-1 do if a[i][1]<lea then begin lea:=a[i][1];ll:=i;end;
  for i:=a[ln][3] to a[ln][2]-a[ln][3] do begin ch:=str[i]; write(ch);end;
  writeln;
  for i:=a[ll][3] to a[ll][2]-a[ll][3] do begin ch:=str[i];write(ch);end;
  close(input);
  close(output);
end.
