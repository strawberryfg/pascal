var n1,n2,i,j,time,k:longint;
    t,s:string;
    tmp:char;
    ok:array[1..2000]of boolean;
    dir:array[1..2000]of longint;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n1,n2);
s:='';
readln(t);
for i:=1 to length(t) do s:=t[i]+s;
readln(t);
s:=s+t;
readln(time);
for i:=1 to n1 do dir[i]:=1;
for i:=n1+1 to length(s) do dir[i]:=-1;
for i:=1 to time do
    begin
    fillchar(ok,sizeof(ok),false);
    for j:=1 to length(s)-1 do
        begin
        if ok[j]=false then
           if (dir[j]+dir[j+1]=0)and(dir[j]=1) then
              begin tmp:=s[j];s[j]:=s[j+1];s[j+1]:=tmp;ok[j]:=true;ok[j+1]:=true;
                    k:=dir[j];dir[j]:=dir[j+1];dir[j+1]:=k;
              end;
        end;
    end;
writeln(s);
close(input);
close(output);
end.