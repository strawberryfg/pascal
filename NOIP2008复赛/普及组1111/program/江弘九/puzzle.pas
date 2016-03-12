var i,j,s:longint;
    a:array[0..9,0..9] of longint;
    n:array[0..100,0..2] of longint;
function check(x,y:longint):boolean;
var i,j,f,l,r:longint;
begin
  f:=0;
  for i:=1 to 9 do
    if a[i,n[x,2]]=y then begin
                            f:=1;
                            break;
                          end;
  if f=0 then begin
                for i:=1 to 9 do
                  if a[n[x,1],i]=y then begin
                                          f:=1;
                                          break;
                                        end;
              end;
  if f=0 then begin
                l:=n[x,1] div 3;
                if n[x,1] mod 3<>0 then l:=l+1;
                r:=n[x,2] div 3;
                if n[x,2] mod 3<>0 then r:=r+1;
                for i:=(l-1)*3+1 to l*3 do
                  for j:=(r-1)*3+1 to r*3 do
                    if a[i,j]=y then begin
                                       f:=1;
                                       break;
                                     end;
              end;
  if f=0 then check:=true else check:=false;
end;
procedure put(x:longint);
var i:longint;
begin
  if x=s+1 then begin
                  for i:=1 to 9 do
                  begin
                    for j:=1 to 9 do
                      if j=9 then write(a[i,j]) else write(a[i,j],' ');
                    writeln;
                  end;
                  close(input);
                  close(output);
                  halt;
                end
           else begin
                  for i:=1 to 9 do
                    if check(x,i) then begin
                                         a[n[x,1],n[x,2]]:=i;
                                         put(x+1);
                                         a[n[x,1],n[x,2]]:=0;
                                       end;
                end;
end;
begin
  assign(input,'puzzle.in');
  reset(input);
  assign(output,'puzzle.out');
  rewrite(output);
  for i:=1 to 9 do
    for j:=1 to 9 do
      read(a[i,j]);
  s:=0;
  for i:=1 to 9 do
    for j:=1 to 9 do
      if a[i,j]=0 then begin
                         s:=s+1;
                         n[s,1]:=i;
                         n[s,2]:=j;
                       end;
  put(1);
  close(input);
  close(output);
end.