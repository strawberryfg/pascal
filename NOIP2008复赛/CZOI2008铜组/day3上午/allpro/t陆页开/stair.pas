var a:array[1..30] of longint;
    p:array[1..30] of boolean;
    i,n,k,f,t:longint;
procedure setup;
  begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
fillchar(a,sizeof(a),0);
readln(n);
readln(k);
t:=0;
for i:=1 to k do
    readln(a[k]);
for i:=1 to k do
    if a[k]<>0 then begin p[k]:=false;t:=t+1;end
               else p[k]:=true;
writeln(t+1);
endit;
end.
