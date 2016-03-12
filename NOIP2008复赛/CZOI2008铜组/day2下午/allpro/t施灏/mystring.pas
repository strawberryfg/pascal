var a:string;
    b:array[1..250] of string;
    c,d:array[1..1000] of longint;
    i,l,s,j:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(a);
l:=0;
s:=0;
a:=a+' ';
for i :=1 to length(a) do
    begin
    b[i]:=a[i];
    if a[i]<>' 'then l:=l+1
                else begin s:=s+1;c[s]:=l;l:=0;d[s]:=i;end;
    end;
for i:=1 to s do
    d[i]:=d[i]-c[i];
for i:=1 to s-1 do
    for j:=i+1 to s do
        if c[i]<c[j] then begin
                          l:=c[i];
                          c[i]:=c[j];
                          c[j]:=l;
                          l:=d[i];
                          d[i]:=d[j];
                          d[j]:=l;
                          end;
for i:=d[1] to c[1]+d[1]-1 do
    begin
    write(a[i]);
    end;
writeln;
if d[s]<>d[s-1] then
                begin
                for i:=d[s] to c[s]+d[s]-1 do
                begin
                write(a[i]);
                end;
                writeln;
                end
                else
                begin
                l:=0;
                s:=0;
                for i:=1 to length(a) do
                    begin
                    s:=s+1;
                    if a[i]<>' ' then l:=l+1
                                 else for i:=s to s+l do
                                      begin
                                      write(a[i]);
                                      end;
                    writeln;
                    exit;
                    end;
                end;
close(input);
close(output);
end.

