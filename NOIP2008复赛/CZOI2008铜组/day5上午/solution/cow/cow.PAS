const maxg=100;
      maxn=200;

type gtype=array[1..maxg] of longint;

var n,i,j:longint;
    a:array[1..maxn] of gtype;

function jia(a,b:gtype):gtype;
var i,r:longint;
    c:gtype;
begin
     r:=0;
     for i:=1 to maxg do
     begin
          c[i]:=(r+a[i]+b[i])mod 10;
          r:=(r+a[i]+b[i]) div 10;
     end;
     jia:=c;
end;

begin
     assign(input,'cow.in');reset(input);
     assign(output,'cow.out');rewrite(output);
     readln(n);
     fillchar(a,sizeof(a),0);
     a[1,1]:=1;a[2,1]:=1;a[3,1]:=1;
     for i:=4 to n do
       a[i]:=jia(a[i-1],a[i-3]);
     j:=maxg;
     while (j>1)and(a[n][j]=0) do dec(j);
     for i:=j downto 1 do write(a[n,i]);
     close(input);close(output);
end.
