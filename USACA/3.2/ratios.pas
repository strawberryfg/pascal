{
ID: xiaweiy1
PROG: ratios
LANG: PASCAL
}
var a,b,c,i,j,k,t,p,u,t1,t2,t3:longint;
    f:array[1..3,1..3]of longint;
    pd:boolean;
function check:boolean;
var g,h:array[1..3]of longint;
    i,j:longint;
begin
fillchar(g,sizeof(g),0);
if (a=0) then g[1]:=1;
if (b=0) then g[2]:=1;
if (c=0) then g[3]:=1;
h[1]:=t1; h[2]:=t2; h[3]:=t3;
for i:=1 to 2 do
    begin
    for j:=i+1 to 3 do
        if (g[i]=0)and(g[j]=0) then
           begin
           if h[i]<>h[j] then exit(false);
           end;
    end;
exit(true);
end;
begin
assign(input,'ratios.in');
reset(input);
assign(output,'ratios.out');
rewrite(output);
readln(a,b,c);
for i:=1 to 3 do
    begin
    for j:=1 to 3 do
        begin
        read(f[i,j]);
        end;
    readln;
    end;
pd:=false;
for i:=0 to 100 do
    begin
    for j:=0 to 100 do
        begin
        for k:=0 to 100 do
            begin
            t:=i*f[1,1]+j*f[2,1]+k*f[3,1];
            p:=i*f[1,2]+j*f[2,2]+k*f[3,2];
            u:=i*f[1,3]+j*f[2,3]+k*f[3,3];
            if (a=0) then
               begin
               if t=0 then t1:=0 else t1:=maxlongint;
               end
            else begin
                 if t mod a=0 then t1:=t div a else t1:=maxlongint;
                 end;
            if (b=0) then
               begin
               if p=0 then t2:=0 else t2:=maxlongint;
               end
            else begin
                 if p mod b=0 then t2:=p div b else t2:=maxlongint;
                 end;
            if (c=0) then
               begin
               if u=0 then t3:=0 else t3:=maxlongint;
               end
            else begin
                 if u mod c=0 then t3:=u div c else t3:=maxlongint;
                 end;
            if (t1=maxlongint)or(t2=maxlongint)or(t3=maxlongint) then continue;
            if (check)and(t>=a)and(p>=b)and(u>=c) then
               begin
               pd:=true;
               break;
               end;
            end;
        if pd then break;
        end;
    if pd then break;
    end;
if not pd then writeln('NONE')
          else writeln(i,' ',j,' ',k,' ',t1);
close(input);
close(output);
end.
