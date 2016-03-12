const maxapp=5000;
type pointype=record x,y,time:longint;end;
var f:array [0..maxapp] of longint;
    app:array[0..maxapp] of pointype;
    n,s:longint;
    i,j,ans:longint;
    m:real;
procedure readata;
var i,j,k:longint;
begin
   read(n,s);
   for i:=1 to n do
     read(app[i].x,app[i].y,app[i].time);
   app[0].x:=0; app[0].y:=0; app[0].time:=0;
end;

procedure sort(l,r: longint);
var i,j,x: longint;
    tmp:pointype;
begin
     i:=l;
     j:=r;
     x:=app[(l+r) div 2].time;
     repeat
           while app[i].time<x do inc(i);
           while x<app[j].time do dec(j);
           if not(i>j) then
             begin
                tmp:=app[i];
                app[i]:=app[j];
                app[j]:=tmp;
                inc(i);
                j:=j-1;
             end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
end;

function dis(i,j:longint):real;
begin
  dis:=sqrt(sqr(app[i].x-app[j].x)+sqr(app[i].y-app[j].y));
end;

begin
    assign(input,'apples.in');
    reset(input);
    assign(output,'apples.out');
    rewrite(output);

    readata;
    sort(1,n);

    f[0]:=0;
    ans:=0;
    for i:=1 to n do
     begin
       f[i]:=0;
       for j:=0 to i-1 do
        if (j=0)or((j<>0)and(f[j]<>0)) then
           begin
             m:=dis(i,j);
             if ( m<=s*(app[i].time-app[j].time) )and( f[j]+1>f[i] )
                then f[i]:=f[j]+1;
           end;
       if f[i]>ans then ans:=f[i];
     end;

    write(ans);
    close(input);close(output);
end.
