program cow;
var n,i:longint;
    all:array[-3..201]of string;
a,b:array[1..200]of longint;
function plus(x,y:string):string;
var temp,i,j:longint;
    sum,x1,y1,now:string;
begin
     sum:='';
     x1:=x;
     y1:=y;
     for i:=1 to length(x1) do
     begin
          val(x1[i],a[i]);
     end;
     for i:=1 to length(y1) do
     begin
          val(y1[i],b[i]);
     end;
    if length(x1)<length(y1) then temp:=length(y1)
           else temp:=length(x1);
    for i:=1 to temp do
    begin
         a[i+1]:=(a[i]+b[i])div 10+a[i+1];
         a[i]:=(a[i]+b[i])mod 10;
    end;
    if a[temp+1]<>0 then temp:=temp+1;
    for i:=temp downto 1 do
    begin
    str(a[i],now);
    sum:=now+sum;
    end;
    exit(sum);
end;
procedure find(dep:longint);
var i:longint;
begin
    if dep<=n then begin  if dep>=3 then all[dep]:=plus(all[dep-1],all[dep-3]);
                         find(dep+1);
                  end;
end;
begin
     assign(input,'cow.in');reset(input);
     assign(output,'cow.out');rewrite(output);
     readln(n);
     for i:=1 to 3 do
     all[i]:='1';
     find(1);
     writeln(all[n]);
     close(input);
     close(output);
end.
