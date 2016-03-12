var x:string; n,i,s:longint; a,h:array [0..100] of longint;
procedure try(dep:longint);
   var i:longint;
   begin
   s:=s+1;
   for i:=1 to n do
   begin
   if h[i]<>a[i] then break;
   end;
   if i=n then begin writeln(s-1); close(input); close(output); halt;end;
   if a[1]=n then writeln(s)
              else if (dep>n)  then
              begin a[dep-1]:=0; a[dep-2]:=a[dep-2]+1;
              try(dep-2)   ;
                                            end
                                            else if a[dep]=n then begin
                                            a[dep]:=0;
                                            a[dep-1]:=a[dep-1]+1;
                                            try(dep-1);
                                            end
                                            else if a[dep]-a[dep-1]>1 then
                                            begin
                                            a[dep+1]:=a[dep]+1;
                                            try(dep+1);
                                            end
                                            else if a[dep]=a[dep-1]+1 then
                                            begin
                                            a[dep+1]:=a[dep]+1;
                                            try(dep+1);
                                            end
                                            else begin a[dep]:=a[dep-1]+1;
                                            try(dep+1);end;

   end;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
S:=0;
readln(x);
for i:=1 to length(x) do
h[i]:=ord(x[i])-64;
try(1);
end.
