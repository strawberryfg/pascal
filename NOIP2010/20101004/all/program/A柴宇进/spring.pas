var i,n,j,ans:longint;
    v:array[0..20] of boolean;
    a:array[0..20,0..20] of longint;
procedure int;
  begin
    readln(n);
    for i:=1 to n do
      begin for j:=1 to n do
              read(a[i,j]);
            readln;
      end;
    ans:=maxlongint;
    fillchar(v,sizeof(v),false);
  end;
procedure search(dep,nows:longint);
  var i,j:longint;
  begin
  if nows<ans then
  begin
    if dep=n shr 1
    then begin if nows<ans then ans:=nows; end
    else begin
            for i:=1 to n do
              if v[i]=false
              then begin v[i]:=true;
                         for j:=1 to n do
                           if v[j]=false
                           then begin v[j]:=true;
                                      search(dep+1,a[i,j]+nows);
                                      v[j]:=false;
                                end;
                         v[i]:=false;
                   end;
         end;
  end;
  end;

begin
assign(input,'spring.in');
reset(input);
assign(output,'spring.out');
rewrite(output);

  int;
  for i:=1 to n do
    if v[i]=false
    then begin v[i]:=true;
               for j:=1 to n do
                 if v[j]=false
                 then begin v[j]:=true;
                            search(1,a[i,j]);
                            v[j]:=false;
                      end;
               v[i]:=false;
         end;
  writeln(ans);

close(input);
close(output);
end.

