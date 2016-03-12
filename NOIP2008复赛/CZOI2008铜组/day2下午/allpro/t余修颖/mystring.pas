var a:array[1..1000]of string;
    b:array[1..1000]of longint;
    n,j,i,t:longint;
    
begin
        assign(input,'mystring.in');
        assign(output,'mystring.out');
        reset(input);
        rewrite(output); 
        n:=0;
        while not eoln do
        begin
        inc(n);
        read(a[n]);
	end;
        for i:=1 to n-1 do
        b[i]:=length(a[n])-1;
        b[n]:=length(a[n]);
        for i:=1 to n-1 do
        begin
           for j:=i+1 to n do
           if b[i]<b[j] then begin t:=b[i]; b[i]:=b[j];b[j]:=t;end;
        end;
           writeln(a[1]);
           writeln(a[n]);
        close(input);
        close(output);
end.
