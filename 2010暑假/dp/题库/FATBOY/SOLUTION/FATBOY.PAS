
{
  Izborne pripreme 2001 - Drugi izborni ispit
  Zadatak FATBOY
  Autor rjesenja Mladen Kolar
  Nesluzbeno rjesenje
}

const potez:array[1..7,1..3] of integer=((-1,0,0),(0,-1,0),(0,0,-1),
                (-1,-1,0),(-1,0,-1),(0,-1,-1),(-1,-1,-1));

var
    f:text;
    l:array[1..3] of integer;
    rijec:array[1..3,1..100] of char;
    mat,how:array[0..100,0..100,0..100] of integer;
    i,j,k,kk,gdje:integer;
    min:array[1..6] of integer;

procedure rek(x,y,z:integer);
begin
    if (x=0) or (y=0) or (z=0) then exit else
        begin
            rek(x+potez[how[x,y,z]][1],y+potez[how[x,y,z]][2],z+potez[how[x,y,z]][3]);
            if how[x,y,z]=7 then write(f,rijec[1][x]);
        end;
end;

begin
    assign(f,'FATBOY.in');
    reset(f);
    l[1]:=0; l[2]:=0; l[3]:=0;
    for i:=1 to 3 do
        begin
            while not eoln(f) do
                begin
                    inc(l[i]); read(f,rijec[i][l[i]]);
                end;
            readln(f);
        end;
    close(f);
    fillchar(mat,sizeof(mat),0); fillchar(how,sizeof(how),0);
    for i:=1 to l[1] do
        for j:=1 to l[2] do
            for k:=1 to l[3] do
                if (rijec[1][i]=rijec[2][j]) and (rijec[1][i]=rijec[3][k]) then
                    begin
                        mat[i,j,k]:=mat[i-1,j-1,k-1]+1;
                        how[i,j,k]:=7;
                    end
                else
                    begin
                        for kk:=1 to 6 do min[kk]:=mat[i+potez[kk][1],j+potez[kk][2],k+potez[kk][3]];
                        gdje:=1;
                        for kk:=2 to 6 do if min[kk]>min[gdje] then gdje:=kk;
                        mat[i,j,k]:=min[gdje];
                        how[i,j,k]:=gdje;
                    end;
    assign(f,'FATBOY.out');
    rewrite(f);
    rek(l[1],l[2],l[3]);
    close(f);
end.
