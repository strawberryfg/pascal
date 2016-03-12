var  a:array [1..1000]of string;
     s,k:string;
     i,l,n:longint;
begin
     assign(input,'broj.in');
     reset(input);
     assign(output,'broj.out');
     rewrite(output); 
     read(n);
     for i:=1 to n do
     begin
     str(i,k);
     a[i]:=k;
     end;
     s:=a[1];
     for i:=2 to n do
     begin
     s:=s+a[i];
     end;
     l:=length(s);
     writeln(l);
     close(input);
     close(output);
end.
