var a,z,n,m,i,k,l:integer;
    g:packed array[1..1000,1..1000]of boolean;
    t:packed array[1..1000]of boolean;
    b:boolean;
procedure try(r:byte;q:boolean);
          var j:integer;
          begin
          if (r=i)and(q=true) then begin writeln('T'); b:=true; exit; end;
          if r<>i then t[r]:=true;
          for j:=1 to n do if (g[r,j]=true)and(t[j]=false) then
              begin
              try(j,true);
              if b=true then exit;
              end;
          end;
begin
assign(input,'message.in');
assign(output,'message.out');
reset(input);
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(a,z);
    g[a,z]:=true;
    end;
for i:=1 to n do
    begin
    for k:=1 to n do
        t[k]:=false;
    b:=false;
    try(i,false);
    if not b then writeln('F');
    end;
close(input);
close(output);
end.
