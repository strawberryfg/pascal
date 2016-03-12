const a:array[1..8]of integer=(1,1,2,2,-1,-1,-2,-2);
      b:array[1..8]of integer=(2,-2,1,-1,2,-2,-1,1);
var s1,s2:string;
    s:array[1..100]of string;
    ml,mz,l,z:integer;
    pd:array[1..10,1..10]of boolean;
procedure print(dep:integer);
var i:integer;
begin
  for i:=1 to dep-2 do
      write(s[i],'->');
  writeln(s[dep-1]);
  close(input); close(output); halt;
end;
procedure zou(l,z,dep:integer);
var i:integer;
begin
  if dep=ml*mz+1 then print(dep);
  for i:=1 to 8 do
  begin
    if (l+a[i]<=ml)and(l+a[i]>=1)and(z+b[i]>=1)and(z+b[i]<=mz)and
       (pd[l+a[i],z+b[i]]=false) then
    begin
      str(l,s1);
      str(z,s2);
      s[dep]:='('+s1+','+s2+')';
      pd[l,z]:=true;
      zou(l+a[i],z+b[i],dep+1);
      pd[l,z]:=false;
      s[dep]:='';
    end;
  end;
end;
begin
  assign(input,'knight.in'); reset(input);
  assign(output,'knight.out'); rewrite(output);
  readln(ml,mz,l,z);
  zou(l,z,1); 
  writeln('No Answer!');
  close(input); close(output);
end.
