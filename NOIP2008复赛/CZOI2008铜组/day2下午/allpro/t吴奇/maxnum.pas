program maxnum;
var n,i,j:longint;
    a:array[1..10000]of longint;
procedure try(x,y:longint);
var r,n1,n2:longint;
begin
     n1:=a[x];
     n2:=a[y];
     while n1 mod n2<>0 do
     begin
          r:=n1 mod n2;
          n1:=n2;
          n2:=r;
     end;
     a[y]:=n2;

end;
begin
     assign(input,'maxnum.in');reset(input);
     assign(output,'maxnum.out');rewrite(output);
     i:=0;
     fillchar(a,sizeof(a),0);
     while not eof do
     begin
     i:=i+1;
     read(a[i]);
     end;
     for j:=1 to i-1 do
     begin
          try(j,j+1);
     end;
     writeln(a[i]);
     close(input);
     close(output);
end.
