var ts,n,i,j,s:longint;
    a:array[0..11,0..11]of char;
function zhao(x,y:longint):boolean;
        var i,j:longint;
        begin
        zhao:=true;
        for i:=x-1 downto 1 do
            begin
            if a[i,y]='X' then exit;
            if a[i,y]='y' then begin zhao:=false;exit;end;
            end;
        end;
begin
assign(input,'fire.in');reset(input);
assign(output,'fire.out');rewrite(output);
readln(n);
for i:=1 to n do
        begin
        for j:=1 to n do
                read(a[i,j]);
        readln;
        end;
s:=0;ts:=0;
for i:=1 to n do
        for j:=1 to n do
                begin
                if (a[i,j]='.')and(s<i)and(zhao(i,j))then begin a[i,j]:='y';inc(s);end
                                        else if(a[i,j]='X')and(a[i,j+1]='.')and(zhao(i,j+1))then
                                             begin
                                             a[i,j+1]:='y';
                                             if s<i then inc(s)
                                                    else inc(ts);
                                             end;
                end;
writeln(s+ts);
close(input);
close(output);
end.
