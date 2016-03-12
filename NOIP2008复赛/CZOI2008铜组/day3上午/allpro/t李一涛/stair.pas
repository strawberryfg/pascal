var a:array[0..30]of integer;
    t:array[1..30]of boolean;
    i,j,k,n,s:integer;
begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);
  readln(n); readln(k); s:=0;
  fillchar(a,sizeof(a),0); fillchar(t,sizeof(t),true);
  for i:=1 to k do begin readln(j); t[j]:=false; end;
  a[0]:=1; a[1]:=1;
  for i:=2 to n do
  if t[i] then a[i]:=a[i-2]+a[i-1] else a[i]:=a[i-1];
  writeln(a[n]);
  close(input);
  close(output);
end.
