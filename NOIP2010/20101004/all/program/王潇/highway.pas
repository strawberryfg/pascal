Var i,j,n,m,s,x,be,en,w,res:longint;
    flag:boolean;
    a:array[1..100000]of longint;
Begin
  assign(input,'highway.in');reset(input);
  assign(output,'highway.out');rewrite(output);
  readln(n,m,s);
  for i:=1 to n do a[i]:=s;
  for i:=1 to m do
    begin
      readln(x,be,en,w);
      if x=1 then
         begin
	   flag:=true;
	   for j:=be to en do
             if a[j]<=0 then begin flag:=false;break;end;
	   if flag then
	      begin
		inc(res);
		for j:=be to en do
		  a[j]:=a[j]-w;
	      end;
	 end;
      if x=2 then
         for j:=be to en do
           if a[j]>0 then a[j]:=a[j]+w;
      if x=3 then
         for j:=be to en do
           if a[j]>0 then
	      if a[j]<w then a[j]:=w;
    end;
  writeln(res);
  close(output);
End.