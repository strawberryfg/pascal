var h:array[1..18] of boolean;
    a:array[1..18,1..18] of longint;
    i,j,n,ans:longint;

  procedure try(dep,s,t:longint);
    var i,j:longint;
    begin
    if s>=ans then exit;
    if dep=n div 2+1 then begin if s<ans then ans:=s; exit; end;
    for i:=t to n do
        if h[i]=false then begin
                           h[i]:=true;
                           for j:=i+1 to n do
                               if h[j]=false then begin
                                                  h[j]:=true;
                                                  try(dep+1,s+a[i,j],i+1);
                                                  h[j]:=false;
                                                  end;
                           h[i]:=false;
                           break;
                           end;
    end;

begin
assign(input,'spring.in');
reset(input);
assign(output,'spring.out');
rewrite(output);
    readln(n);
    for i:=1 to n do
        for j:=1 to n do
            read(a[i,j]);
    ans:=maxlongint;
    try(1,0,1);
    writeln(ans);
close(input);
close(output);
end.