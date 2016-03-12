
{
  Izborne pripreme 2001 - Prvi izborni ispit
  Zadatak STRUJA
  Autor rjesenja Mladen Kolar
  Nesluzbeno rjesenje
}

var
    pos,trosi:array[1..1000] of longint;
    n,gdje:integer;
    left,right,p:array[1..1000,1..1000] of longint;

procedure readinp;
var
    f:text;
    i:integer;
begin
    assign(f,'POWER.in');
    reset(f);
    readln(f,n);
    readln(f,gdje);
    for i:=1 to n do readln(f,pos[i],trosi[i]);
    close(f);
end;

procedure solve;
var
    i,j:integer;
    x:longint;

    function min(a,b:longint):longint;
    begin
        if a>b then min:=b else min:=a;
    end;

begin
    x:=0;
    for i:=1 to n do x:=x+trosi[i];
    for i:=1 to n do
        begin
            p[i,i]:=x-trosi[i];
            for j:=1+i to n do p[i,j]:=p[i,j-1]-trosi[j];
        end;

    left[1,n]:=maxlongint; right[1,n]:=maxlongint;
    left[gdje,gdje]:=0; right[gdje,gdje]:=0;

    for i:=gdje+1 to n do
      begin
        right[gdje,i]:=right[gdje,i-1]+(pos[i]-pos[i-1])*p[gdje,i-1];
        left[gdje,i]:=right[gdje,i]+(pos[i]-pos[gdje])*p[gdje,i];
      end;

    for i:=gdje-1 downto 1 do
      begin
        left[i,gdje]:=left[i+1,gdje]+(pos[i+1]-pos[i])*p[i+1,gdje];
        right[i,gdje]:=left[i,gdje]+(pos[gdje]-pos[i])*p[i,gdje];
      end;

    for i:=gdje-1 downto 1 do
        for j:=gdje+1 to n do
            begin
                left[i,j]:=min(left[i+1,j]+(pos[i+1]-pos[i])*p[i+1,j],
                                right[i+1,j]+(pos[j]-pos[i])*p[i+1,j]);
                right[i,j]:=min(right[i,j-1]+(pos[j]-pos[j-1])*p[i,j-1],
                                left[i,j-1]+(pos[j]-pos[i])*p[i,j-1]);
            end;

end;

procedure writesol;
var
    f:text;
begin
    assign(f,'POWER.out');
    rewrite(f);
    if left[1,n]<right[1,n] then
        writeln(f,left[1,n])
    else
        writeln(f,right[1,n]);
    close(f);
end;

begin
    readinp;
    solve;
    writesol;
end.
