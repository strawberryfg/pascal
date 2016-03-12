type arraytype=array[1..1000] of longint;
var start,ennd,a:arraytype;
    i,j,B,sum:longint;
procedure ql(c:arraytype);
begin
  fillchar(c,sizeof(c),0);
end;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  ql(start); ql(ennd); ql(a); sum:=0;
  readln(B);
  for i:=1 to B do begin readln(start[i],ennd[i]);
                         a[i]:=ennd[i]-start[i]+1; end;
  for i:=1 to B do
    for j:=i+1 to B do
      begin
        if (start[i]<=ennd[j]) and (ennd[i]>=start[j]) and
              (start[i]<>0) and (start[j]<>0) and
                 (ennd[i]<>0) and (ennd[j]<>0) then
                begin
                 start[j]:=0; ennd[j]:=0;
                 if a[i]>a[j] then a[j]:=0
                              else a[i]:=0;
                end;
      end;
  for i:=1 to B do sum:=sum+a[i];
  writeln(sum);
  close(input);
  close(output);
end.