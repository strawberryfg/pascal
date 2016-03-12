var n,k,c:longint;
    f,b,p:array[0..15000] of int64;
procedure init;
var i,j,x:longint;
begin
	readln(n,k,c);
	for i:=1 to n do
          begin read(x);b[i]:=x;end;
end;
procedure sort(l,r: longint);
var i,j:longint;
    x,y:int64;
begin
        i:=l;j:=r;
        x:=b[(l+r) div 2];
        repeat
        while b[i]<x do inc(i);
        while x<b[j] do dec(j);
        if not(i>j) then
           begin
           y:=b[i];b[i]:=b[j];b[j]:=y;
           inc(i);j:=j-1;
           end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
end;
procedure Dp;
var i,j,q:longint;
    d:int64;
    flag:boolean;
begin
	fillchar(f,sizeof(f),0);
        fillchar(p,sizeof(p),0);
	f[0]:=0;
	for i:=k to n do
	   begin
	   f[i]:=(b[i]-b[1])*(b[i]-b[1])+c;
           p[i]:=0;q:=k;
           if p[i-1]>=k then q:=p[i-1];
           for j:=q to i-k do
	     begin
	     d:=f[j]+(b[i]-b[j+1])*(b[i]-b[j+1])+c;
	     if d<f[i] then begin f[i]:=d;p[i]:=j;end;
	     end;
	   end;
	writeln(f[n]);
end;
begin
assign(input,'divide.in');reset(input);
assign(output,'divide.out');rewrite(output);
	init;
	sort(1,n);
	Dp;
close(input);close(output);
end.
