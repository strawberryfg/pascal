var a:array[1..44721,2..36] of boolean;
    b:array[1..40] of integer;
    nf,nt,jf,jt,i,j,total:longint;
    temp:integer;

function change(a,jz:longint):boolean;
var i,j:integer;
begin
  change:=true;
  i:=1;
  while a<>0 do begin b[i]:=a mod jz;a:=a div jz;i:=i+1;end;
  i:=i-1;
  for j:=1 to i div 2 do
    if b[j]<>b[i-j+1] then change:=false;
end;


begin
  assign(input,'base.in');reset(input);
  assign(output,'base.out');rewrite(output);
  total:=0;
  fillchar(a,sizeof(a),false);
  readln(nf,nt,jf,jt);
  for i:=trunc(sqrt(nf))+1 to trunc(sqrt(nt)) do
    for j:=jf to jt do
      a[i,j]:=change(i*i,j);
  for i:=trunc(sqrt(nf))+1 to trunc(sqrt(nt)) do
  begin
    temp:=0;
    for j:=jf to jt do if a[i,j] then temp:=temp+1;
    if temp=1 then begin inc(total);end;
  end;
  writeln(total);
  close(input);
  close(output);
end.