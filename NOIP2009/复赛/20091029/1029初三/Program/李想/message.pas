var a,b,d,e:array[1..10000] of longint;
    ren:array[1..1000,1..1000] of boolean;
    i,j,n,m:longint;
procedure print;
   begin
   if e[i]=1 then exit;
   if d[i]=1 then writeln('T')
             else writeln('F');
   e[i]:=1;
   end;
procedure work(tou,dep:longint);
   begin
   if dep>(2*n-1) then print
                  else for j:=1 to n do
                       if ren[tou,j]=true then
                          begin
                          d[j]:=1;
                          if d[i]=1 then begin print;exit;end;
                          work(j,dep+1);
                          if d[i]=1 then begin print;exit;end;
                          end;
   end;
begin
assign(input,'message.in');
reset(input);
assign(output,'message.in');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(a[i],b[i]);
    ren[a[i],b[i]]:=true;
    end;
fillchar(e,sizeof(e),0);
for i:=1 to n do
    begin
    fillchar(d,sizeof(d),0);
    work(i,1);
    end;
close(input);
close(output);
end.
