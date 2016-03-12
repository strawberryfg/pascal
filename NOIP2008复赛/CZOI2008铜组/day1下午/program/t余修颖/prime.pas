var n,k,i,j:longint;
    a:array[1..n]of longint;
function su(t:integer):longint;
  var i:longint;
begin
     for i:=1 to t div 2 do
     if t mod i<>0 then su:=1
                   else su:=0;
end;

begin
   {assign(input,'prime.in');
     reset(input);
     assign(output,'prime.out');
     rewrite(output);      }

     readln(n);
     a[1]:=1;
     for j:=1 to n do
                 begin
		    while (su(a[j]+a[j+1])=1) do   begin
		      for j:=1 to n-1 do
                      write(a[j],' ');write(a[n]);writeln;   end
                 end
         end;
     close(input);
     close(output);
end.
