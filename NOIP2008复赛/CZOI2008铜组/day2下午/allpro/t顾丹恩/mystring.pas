var a,k,b,c,i,j,max,min:longint;
v,l,z:array[1..150] of longint;
s:string;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s);
max:=0;min:=999999;
a:=length(s);
fillchar(v,sizeof(v),0);
for i:=1 to a do
if s[i]<>' ' then v[i]:=1;
for i:=2 to a do
     		v[i]:=v[i-1]*v[i]+v[i];
for i:=1 to a do
if v[i]>max then begin max:=v[i];b:=i;end;
for i:=1 to a do
if (v[i]<min) and (v[i]>0) and (v[i+1]=0) then begin min:=v[i];c:=i;end;
for i:=(b-max+1) to b do write(s[i]);
writeln;
for k:=(c-min+1) to c do if s[k]<>' ' then write(s[k]);
writeln;
close(input);
close(output);
end.

