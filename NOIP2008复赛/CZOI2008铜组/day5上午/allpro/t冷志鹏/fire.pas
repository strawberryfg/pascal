program fire;
var i,j,k,x,max:longint;
    a,b:array[0..11,0..11]of char;
    count:array[0..11,0..11]of longint;

procedure huan;
var i,j:longint;
begin
        for i:=1 to x do
                for j:=1 to x do
                        b[i,j]:=a[i,j];
end;

procedure try(ii,jj:longint);
var  m,n:longint;
begin
        if b[ii,jj]='.' then
                        begin
                        inc(count[i,j]);
                        b[ii,jj]:='X';
                        for m:=jj+1 to x do if b[ii,m]<>'X' then b[ii,m]:='Z'
                                                        else break;
                        for m:=jj-1 downto 1 do if b[ii,m]<>'X' then b[ii,m]:='Z'
                                                        else break;
                        for m:=ii+1 to x do if b[m,jj]<>'X' then b[m,jj]:='Z'
                                                        else break;
                        for m:=ii-1 downto 1 do if b[m,jj]<>'X' then b[m,jj]:='Z'
                                                        else break;
                        end;
        if (ii=1)and(jj=1) then
                begin
                for m:=1 to x do
                        for n:=1 to x do
                        begin
                        if m=1 then if n=1 then continue;
                        try(m,n);
                        end;
                end;
end;

begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
        readln(x);
        for i:=1 to x do
                begin
                for j:=1 to x do
                        read(a[i,j]);
                readln;
                end;
        for i:=0 to x+1 do
                for j:=0 to x+1 do
                        b[i,j]:='X';
        i:=1;j:=1;
        while (i<>x+1)or(j<>x) do
                begin
                huan;
                if b[i,j]='.' then
                        begin
                        inc(count[i,j]);
                        for k:=1 to x do if b[i,k]<>'X' then b[i,k]:='Z'
                                                        else break;
                        for k:=1 to x do if b[k,j]<>'X' then b[k,j]:='Z'
                                                        else break;
                        b[i,j]:='X';
                        for k:=j+1 to x do if b[i,k]<>'X' then b[i,k]:='Z'
                                                        else break;
                        for k:=j-1 downto 1 do if b[i,k]<>'X' then b[i,k]:='Z'
                                                        else break;
                        for k:=i+1 to x do if b[k,j]<>'X' then b[k,j]:='Z'
                                                        else break;
                        for k:=i-1 downto 1 do if b[k,j]<>'X' then b[k,j]:='Z'
                                                        else break;
                        end;
                try(1,1);
                if j<>x then inc(j)
                        else begin j:=1; inc(i);end;
                end;
        max:=0;
        for i:=1 to x do
                for j:=1 to x do
                        if count[i,j]>max then max:=count[i,j];
        writeln(max);
close(input);
close(output);
end.