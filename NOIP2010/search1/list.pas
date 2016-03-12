var i,n:longint;
    s1,s2:string;
    song:array[1..100]of string;
    a,dir:array[1..100]of longint;
procedure print;
var i:longint;
begin
for i:=1 to n do
    begin
    writeln(song[a[i]]);
    end;
end;
procedure try(dep:longint);
var i:longint;
begin
if dep>n then
   begin
   print;
   close(input);
   close(output);
   halt;
   end;
if dir[dep]=1 then
   begin
   for i:=dep+1 to n do
      begin
      if a[i]=0 then
         begin
         a[i]:=dep;
         try(dep+1);
         a[i]:=0;
         end;
      end;
   end
else if dir[dep]=-1 then
     begin
     for i:=dep-1 downto 1 do
         begin
         if a[i]=0 then
            begin
            a[i]:=dep;
            try(dep+1);
            a[i]:=0;
            end;
         end;
     end
     else
     begin
     try(dep+1);
     end;
end;
begin
assign(input,'list.in');
reset(input);
assign(output,'list.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(s1);
    song[i]:=s1;
    readln(s2);
    if s2='UP' then dir[i]:=1
       else if s2='DOWN' then dir[i]:=-1
                         else a[i]:=i;
    end;
try(1);
close(input);
close(output);
end.