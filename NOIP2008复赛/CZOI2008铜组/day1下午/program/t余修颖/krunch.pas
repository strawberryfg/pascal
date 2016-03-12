var m,n,i,k:longint;
	a:array[1..100]of char;
begin
     assign(input,'krunch.in');
     reset(input);
     assign(output,'krunch.out');
     rewrite(output);

      i:=0;
     while not eof do
     begin
     inc(i);
     readln(a[i]);
     end;
     if a[1]=' ' then for m:=1 to i do a[m]:=a[m+1];
	for m:=1 to i do
	for k:=m+1 to i do
	if (a(m)=a(k)) or (a(m)=A) or (a(m)=E) or (a(m)=I) or (a(m)=O) or (a(m)=U) then continue;
	writeln(a(m));

        close(input);
        close(output);
end.
