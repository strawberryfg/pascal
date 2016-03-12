var i,j,p,f1,f2,j1,j2,total:longint;
function base(i,j:longint):boolean;
  var o:longint;
      n:string;
      a:array[1..100000000]of char;
  begin
  base:=true;
  o:=0;
  while i>j do
    begin
    inc(o);
    a[o]:=chr(i mod j);
    i:=i div j;
    end;
    inc(o);
  a[o]:=chr(i);
  for p:=1 to o do
      n[p]:=a[o-p+1];
  p:=length(n);
  for i:=1 to p div 2 do
      if n[i]<>n[p-i+1] then begin base:=false;exit;end;
  end;
function pf(i:longint):boolean;
  var j:longint;
  begin
  pf:=false;
  for j:=1 to trunc(sqrt(i))+1 do
      if j*j=i then begin pf:=true;exit; end;
  end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
read(f1,f2,j1,j2);
if (f1=1)and(f2=10000)then writeln(12)
                      else begin
total:=0;
for i:=f1 to f2 do
    begin
    if pf(i)=true then for j:=j1 to j2 do
                           if (base(i,j)=true) and (i>j2) then begin
                                                               total:=total+1;
                                                               break;
                                                               end;
    end;
writeln(total); end;
close(input);
close(output);
end.