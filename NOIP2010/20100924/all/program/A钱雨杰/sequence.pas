var a:array[0..100010] of longint;
    n,i:longint;
    ok:boolean;

begin
assign(input,'sequence.in');
reset(input);
assign(output,'sequence.out');
rewrite(output);
    readln(n);
    for i:=1 to n do
        begin
        readln(a[i]);
        if a[i]<a[i-1] then begin ok:=true; break; end;
        end;
    if ok=true then writeln(0)
               else writeln(a[2]-a[1]+1);
close(input);
close(output);
end.