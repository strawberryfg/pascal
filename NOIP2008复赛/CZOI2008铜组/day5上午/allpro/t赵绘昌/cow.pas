var b:array[0..2000] of string;
    xx,yy,zz:array[0..100] of longint;
    i,j,k,n,gg:longint;
function dd(a,m:string):string;
  var i,j,s,k,ll,lll:longint;
  begin
  fillchar(xx,sizeof(xx),0);
  fillchar(yy,sizeof(yy),0);
  fillchar(zz,sizeof(zz),0);
  dd:='';
  i:=0;
  j:=0;
  ll:=0;
  lll:=0;
  i:=length(a)+1;
  while i>1 do
        begin
        dec(i);
        inc(ll);
        xx[ll]:=ord(a[i])-48;
        end;
  j:=length(m)+1;
  while j>1 do
        begin
        dec(j);
        inc(lll);
        yy[lll]:=ord(m[j])-48;
        end;
  i:=length(a);
  for s:=1 to i do
      begin
      zz[s]:=zz[s]+xx[s]+yy[s];
      if zz[s]>=10 then begin zz[s+1]:=zz[s+1]+zz[s] div 10; zz[s]:=zz[s] mod 10; end;
      end;
  if zz[1+i]>0 then inc(i);
  for j:=i downto 1 do
      dd:=dd+char(zz[j]+48);
  end;
procedure endd;
  begin
  close(input);
  close(output);
  end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
b[1]:='1';
b[2]:='1';
b[3]:='1';
b[4]:='2';
for gg:=5 to n do
    begin
    b[gg]:=dd(b[gg-1],b[gg-3]);
    end;
writeln(b[n]);
endd;
end.
