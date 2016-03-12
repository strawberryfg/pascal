program asdf;
const
bg=999997;
var
x,i,j,k,m,n,l,z:longint;
a,c:array[1..105000] of longint;
u:array[0..bg] of boolean;
begin
  assign(input,'panda.in');
  assign(output,'panda.out');
  reset(input);
  rewrite(output);
  readln(n,k);
 for i:=1 to n do
    read(a[i]);
  c[1]:=1;
  for i:=2 to k+1 do
   begin
      x:=maxlongint;
      for j:=1 to i-1 do
          for z:=1 to n do
            if {(u[(c[j]*a[z])mod bg]<>true)and(}
              (c[j]*a[z]<=x)and(c[j]*a[z]>c[i-1]) then
             x:=c[j]*a[z];
       c[i]:=x;
       // u[x mod bg]:=true;
    end;
 writeln(c[k+1]);
  close(input);
  close(output);
end.