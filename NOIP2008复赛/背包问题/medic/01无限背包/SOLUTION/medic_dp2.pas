{copyright@hy 2006}
var a:array[1..1000] of longint;
    t{total time},n{number},i,j,max:longint;
    m{per time},v{value}:array[1..100] of longint;
begin
    assign(input,'medic.in');
    assign(output,'medic.out');
    reset(input);
    rewrite(output);
    readln(t,n);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do
      begin
        readln(m[i],v[i]);
        if a[m[i]]<v[i] then a[m[i]]:=v[i];
      end;
    for i:=1 to t do
      for j:=1 to n do
        begin
          if (i+m[j]>t)or(m[j]>t)or(a[i]=0) then continue;
          if (a[i]+v[j]>a[i+m[j]]) then a[i+m[j]]:=a[i]+v[j];
        end;
    max:=0;
    for i:=1 to t do
      if a[i]>max then max:=a[i];
    writeln(max);
    close(input);
    close(output);
end.
