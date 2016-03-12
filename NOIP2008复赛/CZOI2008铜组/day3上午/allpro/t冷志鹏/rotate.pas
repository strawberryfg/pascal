program rotate;
var n,i,j,l:longint;
    a:array[0..100,0..100]of longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
        readln(n);
        for i:=1 to n do
                for j:=1 to n do
                        a[i,j]:=-1;
        i:=1;
        j:=0;
        l:=0;
        while l<n*n do
        begin
                inc(l);
                                if a[i,j+1]=-1 then begin inc(j);a[i,j]:=l;end
                                              else if a[i+1,j]=-1 then begin inc(i);a[i,j]:=l;end
                                                                 else if a[i,j-1]=-1 then begin dec(j);a[i,j]:=l;end
                                                                                       else if a[i-1,j]=-1 then begin dec(i);a[i,j]:=l;end; 
        end;
        for i:=1 to n do
                begin
                for j:=1 to n do
                        write(a[i,j]:4);
                writeln;
                end;
close(input);
close(output);
end.