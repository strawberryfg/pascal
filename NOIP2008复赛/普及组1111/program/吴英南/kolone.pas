var k,j,i,a,b,m,n,t:longint;
    aa:array[0..10,1..2]of char;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(a,b);
for i:=1 to a+b do
    begin
    aa[i,1]:=' ';
    aa[i,2]:=' ';
    end;
for i:=a downto 1 do
    read(aa[i,1]);
readln;
for i:=a+1 to a+b do
    read(aa[i,2]);
readln;
read(t);
if a>b then begin m:=a;n:=b;end
        else begin m:=b;n:=a;end;
for i:=1 to t do
    begin
    for j:=n to 1 do
    begin
    if (aa[k,1]<>' ')and(aa[k+1,2]<>' ') then begin
                                              aa[j+1,1]:=aa[j,1];
                                              aa[j,1]:=' ';
                                              aa[j,2]:=aa[j+1,2];
                                              aa[j+1,2]:=' ';
                                              end;
    if (aa[a+b-k+1,2]<>' ')and(aa[a+b-k,1]<>' ') then begin
                                                      aa[a+b-k+1,1]:=aa[a+b-k,1];
                                                      aa[a+b-k,1]:=' ';
                                                      aa[a+b-k,2]:=aa[a+b-k+1,2];
                                                      aa[a+b-k+1,2]:=' ';
                                                      end;
    end;
    end;
for i:=1 to a do
    if aa[i,1]<>' ' then write(aa[i,1])
                    else write(aa[i,2]);
for i:=a+1 to a+b do
    if aa[i,2]<>' ' then write(aa[i,2])
                    else write(aa[i,1]);
close(input);
close(output);
end.
