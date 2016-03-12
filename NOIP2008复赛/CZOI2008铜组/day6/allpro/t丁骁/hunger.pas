type
     tp=array[-1..1001] of longint;
const
     maxn=2000;
var
     n,m,i,j,k,sum:longint;
     x,y:tp;

procedure fz(a,b:longint);
var
     pc:tp;
     s1,s2:longint;
     pd:boolean;
begin
     fillchar(pc,sizeof(pc),0);
     s1:=0; s2:=0; pd:=false;
     for k:=x[a] to y[a] do
         begin
         inc(s1);
         pc[k]:=1;
         end;
     for k:=x[b] to y[b] do
         begin
         inc(s2);
         if pc[k]=1 then pd:=true;
         pc[k]:=1;
         end;
     if pd then
        begin
        if s1>=s2 then
           begin
           x[b]:=0;
           y[b]:=-1;
           end;
        if s1<s2 then
           begin
           x[a]:=0;
           y[a]:=-1;
           end;
        end;
end;

begin
     assign(input,'hunger.in');
     assign(output,'hunger.out');
     reset(input);
     rewrite(output);

     readln(n);
     for i:=1 to n do
         readln(x[i],y[i]);
     for i:=1 to n do
         for j:=i+1 to n do
             if (x[i]<>0)and(x[j]<>0) then
                fz(i,j);
     sum:=0;
     for i:=1 to n do
         for j:=x[i] to y[i] do
             inc(sum);
     writeln(sum);

     close(input);
     close(output);
end.
