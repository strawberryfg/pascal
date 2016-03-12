var a:array[1..1000] of longint;
    s:array[1..1000] of set of byte;
    totaltime,n,i,j,max:longint;
    t,v:array[1..100] of longint;
begin
    assign(input,'medic.in');
    assign(output,'medic.out');
    reset(input);
    rewrite(output);
    readln(totaltime,n);
    fillchar(a,sizeof(a),0);
    for i:=1 to totaltime do  s[i]:=[];
    for i:=1 to n do
      begin
        readln(t[i],v[i]);
        if a[t[i]]<v[i] then
        begin
          a[t[i]]:=v[i];s[t[i]]:=[i];
        end;
      end;
    for i:=1 to totaltime do
      for j:=1 to n do
        begin
          if (i+t[j]>totaltime) or (t[j]>totaltime) or (a[i]=0) then continue;
          if (s[i]*[j]=[]) and (a[i]+v[j]>a[i+t[j]]) then
          begin
            a[i+t[j]]:=a[i]+v[j];s[i+t[j]]:=s[i]+[j];
          end;
        end;
    max:=0;
    for i:=1 to totaltime do
      if a[i]>max then max:=a[i];
    writeln(max);
    close(input);
    close(output);
end.
