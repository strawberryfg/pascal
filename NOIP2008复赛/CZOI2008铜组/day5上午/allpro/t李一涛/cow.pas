var a:array[1..200]of string;
    b1,b2:array[1..100]of integer;
    n,i,l1,l2:longint;
    s1,s2,s:string;
function work(s1,s2:string):string;
var l1,l2,l,i:longint;
    s3:string;
begin
  fillchar(b1,sizeof(b1),0); fillchar(b2,sizeof(b2),0);
  l1:=length(s1); l2:=length(s2); s:=''; s3:='';
  for i:=1 to l1 do b1[100-l1+i]:=ord(s1[i])-ord('0');
  for i:=1 to l2 do b2[100-l2+i]:=ord(s2[i])-ord('0');
  if l1>l2 then l:=l1 else l:=l2;
  for i:=1 to l do
    b2[100-i+1]:=b2[100-i+1]+b1[100-i+1];
  for i:=1 to l do
  begin
    if b2[100-i+1]>9 then begin
    b2[100-i]:=b2[100-i]+b2[100-i+1] div 10;
    b2[100-i+1]:=b2[100-i+1] mod 10;
    end;
  end;
  for i:=0 to l do begin
  str(b2[100-l+i],s3);
  s:=s+s3;
  end;
  while s[1]='0' do delete(s,1,1);
  work:=s;
end;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  readln(n);
  a[1]:='1'; a[2]:='1'; a[3]:='1';
  for i:=4 to n do a[i]:=work(a[i-1],a[i-3]);
  writeln(a[n]);
  close(input);
  close(output);
end.
