var a,r:array[1..1000,1..1000] of longint;
    x,y,i,j,n,m:longint;
    rp:boolean;
procedure setup;
  begin
  assign(input,'message.in');
  reset(input);
  assign(output,'message.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
function work(q,p,dep:longint):boolean;
  var i:longint;
  begin
  if dep>n then begin
                work:=false;
                exit;
                end;
  if r[q,p]=1 then begin
                   work:=true;
                   exit;
                   end;
  if r[q,p]=-1 then begin
                   work:=false;
                   exit;
                   end;
  if q=p then begin
              work:=true;
              exit;
              end
         else begin
              for i:=1 to n do
                  if a[q,i]=1 then
                     if work(i,p,dep+1) then begin
                                             r[q,p]:=1;
                                             work:=true;
                                             exit;
                                             end;
              r[q,p]:=-1;
              work:=false;
              exit;
              end;
  end;
begin
setup;
readln(n,m);
fillchar(r,sizeof(r),0);
for i:=1 to m do
    begin
    readln(x,y);
    a[x,y]:=1;
    end;
for i:=1 to n do
    begin
    rp:=false;
    for j:=1 to n do
        if a[i,j]=1 then
           if work(j,i,1) then begin
                               rp:=true;
                               writeln('T');
                               break;
                               end;
    if rp then continue
          else writeln('F');
    end;
endit;
end.
