var s:array[1..2]of string;
    a:array[1..3,1..3]of longint;
    i,j:longint;
function pose(a:string;b,c:longint):string;
        var i:longint;
            s:string;
        begin
        i:=0;s:='';
        while i<c do
                begin
                s:=s+a[i+b];
                inc(i);
                end;
        pose:=s;
        end;
begin
assign(input,'natrij.in');reset(input);
assign(output,'natrij.out');rewrite(output);
readln(s[1]);
readln(s[2]);
for i:=1 to 2 do
    for j:=1 to 3 do
        val(pose(s[i],(j-1)*3+1,2),a[i,j]);
for i:=3 downto 2 do
        if a[2,i]>=a[1,i] then a[3,i]:=a[2,i]-a[1,i]
                         else begin a[3,i]:=a[2,i]+60-a[1,i];dec(a[2,i-1]);end;
if a[2,1]>a[1,1] then a[3,1]:=a[2,1]-a[1,1]
                 else a[3,1]:=a[2,1]-a[1,1]+24;
for i:=1 to 2 do
        if a[3,i]>=10 then write(a[3,i],':')
                     else begin write(0);write(a[3,i],':');end;
if a[3,3]>=10 then writeln(a[3,3])
             else begin write(0);writeln(a[3,3]);end;
close(input);
close(output);
end.