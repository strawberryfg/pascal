var i,j,n,k:longint;
    a:boolean;
begin
read(n);
j:=1;
for i:=1 to 2*n-1 do
begin
 if i=1   then begin a:=false; k:=1; end;
 if i=n+1 then begin a:=true; k:=n-1; end;
 repeat
 begin
 if j<=n-k then write(' ') else write('* ');
 j:=j+1;
 end;
 until j>n;
 j:=1;
 if a=false then k:=k+1 else k:=k-1;
 writeln;
end;
end.