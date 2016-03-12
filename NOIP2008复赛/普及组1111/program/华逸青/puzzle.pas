var i,j,k,n:longint;
    h1,h2,h3:array[1..9,0..9] of boolean;
    g:array[1..9,1..9] of longint;
procedure outit;
var i,j:longint;
begin
    for i:=1 to 9 do
    begin
        write(g[i,1]);
        for j:=2 to 9 do write(' ',g[i,j]);
        writeln
    end;
    close(input);close(output);halt
end;

procedure work(x,y:longint);
var i,j,k:longint;
begin
    if x=10 then outit;
    if g[x,y]<>0 then begin if y=9 then work(x+1,1) else work(x,y+1);exit end;
    for i:=1 to 9 do
    begin
        if h1[x,i] and h2[y,i] and h3[(x-1) div 3*3+(y-1) div 3+1,i] then
        begin
            h1[x,i]:=false;h2[y,i]:=false;
            h3[(x-1) div 3*3+(y-1) div 3+1,i]:=false;
            g[x,y]:=i;
            if y=9 then work(x+1,1) else work(x,y+1);
            h1[x,i]:=true;h2[y,i]:=true;
            h3[(x-1) div 3*3+(y-1) div 3+1,i]:=true;
            g[x,y]:=0;
        end;
    end;
end;

begin
    assign(input,'puzzle.in');reset(input);
    assign(output,'puzzle.out');rewrite(output);
    fillchar(h1,sizeof(h1),true);
    fillchar(h2,sizeof(h2),true);
    fillchar(h3,sizeof(h3),true);
    for i:=1 to 9 do
    begin
        for j:=1 to 9 do
        begin
            read(g[i,j]);
            h1[i,g[i,j]]:=false;
            h2[j,g[i,j]]:=false;
            h3[(i-1) div 3*3+(j-1) div 3+1,g[i,j]]:=false;
        end;
        readln
    end;
    work(1,1);
    close(input);
    close(output)
end.
