//19:10;
var a,b,c:string;
    ts:char;
	t,p,i,la,lb,lc,spe:longint;
	hash:array[0..30]of integer;
	convert,belong:array[0..30]of longint;
	pd:boolean;
begin
assign(input,'spy.in');
reset(input);
assign(output,'spy.out');
rewrite(output);
readln(a);
readln(b);
readln(c);
la:=length(a); lb:=length(b); lc:=length(c);
for i:=1 to lb do
    begin
	t:=ord(b[i])-ord('A')+1;
	hash[t]:=1;
    end;
    pd:=true;
    for i:=1 to 26 do
        if hash[i]=0 then begin pd:=false;break; end;
   if pd then
   begin
   for i:=1 to la do
       begin
	   t:=ord(a[i])-ord('A')+1;
	   p:=ord(b[i])-ord('A')+1;
	   if (belong[t]<>0)and(belong[t]<>p) then begin pd:=false;break; end;
	   belong[t]:=p;
	   convert[p]:=t;
	   end;
   if pd then
      begin
	  for i:=1 to lc do
	      begin
		  spe:=ord(c[i])-ord('A')+1;
		  ts:=char(belong[spe]+ord('A')-1);
		  write(ts);
		  end;
	  writeln;
	  end;
   end;
 if not pd then
     begin
	 writeln('Failed');
	 end;
close(input);
close(output);
end.
