var opt:array[0..400,0..400] of int64;
    girls,boys,b,g:array[0..400] of longint;
    n,i:longint;
procedure int;
  begin
    readln(n);
    girls[0]:=0;
    for i:=1 to n do
      begin readln(g[i]);
            girls[i]:=girls[i-1]+g[i];
      end;
    boys[0]:=0;
    for i:=1 to n do
      begin readln(b[i]);
            boys[i]:=boys[i-1]+b[i];
      end;
  end;
procedure dp;
  var ki,kj,i,j,ei,ej:longint;
      x,y,ans:int64;
  begin
    fillchar(opt,sizeof(opt),128);
    opt[0,0]:=0;
    for i:=1 to n do
      for j:=1 to n do
       begin y:=g[i]*b[j];
        x:=y-int64(girls[i-1]*girls[i-1])-int64(boys[j-1]*boys[j-1]);
        if x>opt[i,j] then opt[i,j]:=x;
        ei:=i-50; if ei<0 then ei:=0;
        ej:=j-50; if ej<0 then ej:=0;
        for ki:=i-1 downto ei do
          for kj:=j-1 downto ej do
            begin x:=int64(opt[ki,kj]-int64((girls[i-1]-girls[ki])*(girls[i-1]-girls[ki]))-
                     int64((boys[j-1]-boys[kj])*(boys[j-1]-boys[kj])+y));
                  if x>opt[i,j] then opt[i,j]:=x;
            end;
        end;
    ans:=-maxlongint;
    for i:=1 to n do
      for j:=1 to n do
        begin opt[i,j]:=int64(opt[i,j]-int64((girls[n]-girls[i])*(girls[n]-girls[i]))-int64((boys[n]-boys[j])*(boys[n]-boys[j])));
              if opt[i,j]>ans then ans:=opt[i,j];
        end;
    writeln(ans);
  end;

begin
assign(input,'concert.in');
reset(input);
assign(output,'concert.out');
rewrite(output);

  int;
  dp;

close(input);
close(output);
end.
