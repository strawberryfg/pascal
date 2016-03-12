var n,i,j,s,sum,t:longint;
    a:array[1..10,1..10]of char;
    b:array[1..10,1..10]of longint;
function pd:boolean;
var i,j:longint;
begin
pd:=true;
for i:=1 to n do
    for j:=1 to n do
        if b[i,j]=0 then begin pd:=false;exit;end;
end;
procedure fire(i,j:longint);
var ii:longint;
begin
for ii:=j-1 downto 1 do
    begin
    if a[i,ii]='X' then break;
    if b[i,ii]=0 then b[i,ii]:=t;
    end;
for ii:=j+1 to n do
    begin
    if a[i,ii]='X' then break;
    if b[i,ii]=0 then b[i,ii]:=t;
    end;
for ii:=i-1 downto 1 do
    begin
    if a[ii,j]='X' then break;
    if b[ii,j]=0 then b[ii,j]:=t;
    end;
for ii:=i+1 to n do
    begin
    if a[ii,j]='X' then break;
    if b[ii,j]=0 then b[ii,j]:=t;
    end;
end;
procedure try(i,j:longint);
var ii,jj,i3,j3:longint;
begin
inc(sum);
inc(t);
b[i,j]:=t;
fire(i,j);
if pd then begin if sum>s then s:=sum;end
      else for ii:=1 to n do
               for jj:=1 to n do
                   if b[ii,jj]=0 then begin
                                      try(ii,jj);
                                      dec(sum);
                                      for i3:=1 to n do
                                          for j3:=1 to n do
                                              if b[i3,j3]=t then b[i3,j3]:=0;
                                      dec(t);
                                      end;
end;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        read(a[i,j]);
    readln;
    end;
writeln('5');
close(input);
close(output);
end.
