var i,n,m,j:longint;
g:boolean;
a,b:array[1..1000]of longint;
procedure ch(w,x:longint);
var j:longint;
begin
if x>1000 then begin writeln('F');close(input);close(output);halt;end;
if w=i then g:=true;
if g=true then exit;
for j:=1 to n do
	if a[j]=w then ch(b[j],x+1);
end;
begin
assign(input,'message.in');
reset(input);
assign(output,'message.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
	readln(a[i],b[i]);
for i:=1 to n do
	begin
	g:=false;
	for j:=1 to m do
                if a[j]=i then begin ch(b[i],1);if g=true then break;end;
	if g then writeln('T')
		else writeln('F')
	end;
close(input);
close(output);
end.
