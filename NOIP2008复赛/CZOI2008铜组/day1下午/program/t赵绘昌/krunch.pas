var i,j,k,len:longint;
    x,y,a:string;
function pd(a:char;k:longint):boolean;
  var i:longint;
  begin
  pd:=true;
  if a='0' then begin pd:=false; exit; end;
  for i:=1 to k-1 do
      if (x[i]=a)and(a<>' ') then begin pd:=false; exit; end;
  end;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(x);
len:=length(x);
i:=1;
while x[i]=' ' do
      begin
      x[i]:='0';
      inc(i);
      end;
for i:=i to len do
    begin
    case x[i] of
    'A','E','I','O','U':x[i]:='0';
    ' ':begin if x[i-1]=' ' then x[i]:='0';
                case x[i+1] of
                '.',',','?':x[i]:='0';
                end;
    end;
    end;
    end;
y:='';
for i:=1 to len do
    if pd(x[i],i) then y:=y+x[i];
len:=length(y);
for i:=1 to len do
    if (y[i]=' ')and(y[i-1]=' ') then continue
                                 else write(y[i]);
close(input);
close(output);
end.
